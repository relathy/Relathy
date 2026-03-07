import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'immutable_mutable.dart';

class ImmutableMutableGenerator extends GeneratorForAnnotation<GenerateImmutableMutable> {
  static final _annotationChecker = TypeChecker.typeNamedLiterally('GenerateImmutableMutable');

  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        '@GenerateImmutableMutable can only be used on abstract interface classes.',
        element: element,
      );
    }

    final classElement = element;
    if (!classElement.isAbstract) {
      throw InvalidGenerationSourceError(
        '@GenerateImmutableMutable requires an abstract interface class.',
        element: element,
      );
    }

    final interfaceName = classElement.displayName;
    final immutableName = 'Immutable$interfaceName';
    final mutableName = 'Mutable$interfaceName';

    final getters = classElement.getters
        .where((x) => !x.isStatic && !_isObjectGetter(x.displayName))
        .toList();

    final fields = getters
        .map(
          (getter) => _FieldInfo(
            name: getter.displayName,
            type: getter.returnType,
            isImmutableField: _hasImmutableFieldAnnotation(getter),
          ),
        )
        .toList();

    final out = StringBuffer();

    out.writeln(_generateImmutable(interfaceName, immutableName, mutableName, fields));
    out.writeln();
    out.writeln(_generateMutable(interfaceName, immutableName, mutableName, fields));

    return out.toString();
  }

  static bool _isObjectGetter(String name) {
    return name == 'hashCode' || name == 'runtimeType';
  }

  bool _hasImmutableFieldAnnotation(PropertyAccessorElement getter) {
    return getter.metadata.annotations.any((meta) {
      final value = meta.computeConstantValue();
      final typeName = value?.type?.getDisplayString();
      return typeName == 'ImmutableField';
    });
  }

  String _generateImmutable(
    String interfaceName,
    String immutableName,
    String mutableName,
    List<_FieldInfo> fields,
  ) {
    final out = StringBuffer();

    out.writeln('@immutable');
    out.writeln('class $immutableName implements $interfaceName {');

    for (final field in fields) {
      out.writeln('  @override');
      out.writeln('  final ${_immutableFieldType(field.type)} ${field.name};');
      out.writeln();
    }

    out.writeln('  $immutableName({');
    for (final field in fields) {
      out.writeln('    required this.${field.name},');
    }
    out.writeln('  });');
    out.writeln();

    out.writeln('  factory $immutableName.fromJson(Map<String, dynamic> json) => $immutableName(');
    for (final field in fields) {
      out.writeln(
        '    ${field.name}: ${_fromJsonExpr(_immutableShape(field.type), "json[\'${field.name}\']")},',
      );
    }
    out.writeln('  );');
    out.writeln();

    out.writeln('  Map<String, dynamic> toJson() => {');
    for (final field in fields) {
      out.writeln('    \'${field.name}\': ${_toJsonExpr(_immutableShape(field.type), field.name)},');
    }
    out.writeln('  };');
    out.writeln();

    out.writeln('  $mutableName toMutable() => $mutableName(');
    for (final field in fields) {
      out.writeln('    ${field.name}: ${_immutableToMutableExprForField(field, field.name)},');
    }
    out.writeln('  );');

    out.writeln('}');

    return out.toString();
  }

  String _generateMutable(
    String interfaceName,
    String immutableName,
    String mutableName,
    List<_FieldInfo> fields,
  ) {
    final out = StringBuffer();

    out.writeln('class $mutableName implements $interfaceName {');

    for (final field in fields) {
      if (_isObservableScalarField(field)) {
        final fieldType = _mutableFieldType(field);
        out.writeln('  final Observable<$fieldType> _${field.name};');
        out.writeln();
        out.writeln('  @override');
        out.writeln('  $fieldType get ${field.name} => _${field.name}.value;');
        out.writeln('  set ${field.name}($fieldType value) => _${field.name}.value = value;');
        out.writeln();
      } else {
        final fieldType = _mutableFieldType(field);
        final isFinal = _isAlwaysFinal(field);
        out.writeln('  @override');
        out.writeln('  ${isFinal ? 'final' : ''} $fieldType ${field.name};');
        out.writeln();
      }
    }

    out.writeln('  $mutableName({');
    for (final field in fields) {
      if (_needsCustomMutableInitializer(field)) {
        out.writeln('    ${_mutableCtorParamType(field)} ${field.name},');
      } else {
        out.writeln('    required this.${field.name},');
      }
    }
    out.writeln('  })${_mutableInitializers(fields)};');
    out.writeln();

    out.writeln('  $immutableName toImmutable() => $immutableName(');
    for (final field in fields) {
      out.writeln('    ${field.name}: ${_mutableToImmutableExprForField(field, field.name)},');
    }
    out.writeln('  );');

    out.writeln('}');

    return out.toString();
  }

  bool _isObservableScalarField(_FieldInfo field) {
    if (field.isImmutableField) return false;

    final shape = _mutableShape(field.type);
    if (shape.kind != _TypeKind.simple) return false;
    if (shape.baseName.endsWith('Id')) return false;

    return true;
  }

  bool _needsCustomMutableInitializer(_FieldInfo field) {
    if (field.isImmutableField) return false;

    final shape = _mutableShape(field.type);
    return shape.kind == _TypeKind.list || shape.kind == _TypeKind.map || _isObservableScalarField(field);
  }

  String _mutableInitializers(List<_FieldInfo> fields) {
    final parts = <String>[];

    for (final field in fields) {
      if (field.isImmutableField) continue;

      final shape = _mutableShape(field.type);
      if (shape.kind == _TypeKind.list) {
        parts.add('${field.name} = ArgsHelper.toMutableList(${field.name})');
      } else if (shape.kind == _TypeKind.map) {
        parts.add('${field.name} = ArgsHelper.toMutableMap(${field.name})');
      } else if (_isObservableScalarField(field)) {
        parts.add('_${field.name} = Observable(${field.name})');
      }
    }

    return parts.isEmpty ? '' : ' : ${parts.join(', ')}';
  }

  bool _isAlwaysFinal(_FieldInfo field) {
    if (field.isImmutableField) return true;

    final shape = _mutableShape(field.type);
    if (shape.kind == _TypeKind.list || shape.kind == _TypeKind.map) return true;
    if (shape.baseName.endsWith('Id')) return true;
    if (field.name.endsWith('Id')) return true;
    return false;
  }

  String _mutableCtorParamType(_FieldInfo field) {
    if (_isObservableScalarField(field)) {
      return 'required ${_mutableFieldType(field)}';
    }

    final shape = _mutableShape(field.type);

    if (shape.kind == _TypeKind.list) {
      return 'Iterable<${shape.args.single.render()}>?';
    }
    if (shape.kind == _TypeKind.map) {
      return 'Map<${shape.args[0].render()}, ${shape.args[1].render()}>?';
    }

    return _mutableFieldType(field);
  }

  String _immutableFieldType(DartType type) => _immutableShape(type).render();

  String _mutableFieldType(_FieldInfo field) {
    if (field.isImmutableField) {
      return _immutableShape(field.type).render();
    }
    return _mutableShape(field.type).render();
  }

  _ResolvedType _immutableShape(DartType type) {
    return _rewriteType(type, mode: _Mode.immutable);
  }

  _ResolvedType _mutableShape(DartType type) {
    return _rewriteType(type, mode: _Mode.mutable);
  }

  _ResolvedType _rewriteType(DartType type, {required _Mode mode}) {
    final nullable = type.nullabilitySuffix == NullabilitySuffix.question;

    if (type is InterfaceType) {
      final element = type.element;
      final name = element.displayName;
      final args = type.typeArguments;

      if (name == 'ReadOnlyList' || name == 'ObservableReadOnlyList') {
        return _ResolvedType.list(
          baseName: mode == _Mode.immutable ? 'ImmutableList' : 'MutableList',
          args: [_rewriteType(args.single, mode: mode)],
          isNullable: nullable,
        );
      }

      if (name == 'ReadOnlyMap' || name == 'ObservableReadOnlyMap') {
        return _ResolvedType.map(
          baseName: mode == _Mode.immutable ? 'ImmutableMap' : 'MutableMap',
          args: [
            _rewriteType(args[0], mode: mode),
            _rewriteType(args[1], mode: mode),
          ],
          isNullable: nullable,
        );
      }

      if (_isGeneratedInterfaceElement(element)) {
        return _ResolvedType.simple(
          baseName: '${mode == _Mode.immutable ? 'Immutable' : 'Mutable'}$name',
          isNullable: nullable,
        );
      }

      return _ResolvedType.simple(
        baseName: type.getDisplayString(withNullability: false),
        isNullable: nullable,
      );
    }

    return _ResolvedType.simple(
      baseName: type.getDisplayString(withNullability: false),
      isNullable: nullable,
    );
  }

  bool _isGeneratedInterfaceElement(Element? element) {
    if (element is! InterfaceElement) return false;
    return _annotationChecker.hasAnnotationOf(element);
  }

  String _fromJsonExpr(_ResolvedType type, String sourceExpr) {
    if (type.isNullable) {
      final nonNull = type.nonNullable();
      return '$sourceExpr == null ? null : ${_fromJsonExpr(nonNull, sourceExpr)}';
    }

    if (type.kind == _TypeKind.map) {
      final keyType = type.args[0];
      final valueType = type.args[1];
      return 'ImmutableMap.fromJson('
          '($sourceExpr as Map<String, dynamic>), '
          'fromJsonK: (key) => ${_fromJsonKeyExpr(keyType, 'key')}, '
          'fromJsonV: (value) => ${_fromJsonValueExpr(valueType, 'value')}'
          ')';
    }

    if (type.kind == _TypeKind.list) {
      final itemType = type.args.single;
      return 'ImmutableList.fromJson('
          '($sourceExpr as List<dynamic>), '
          '(item) => ${_fromJsonValueExpr(itemType, 'item')}'
          ')';
    }

    if (_isString(type)) return '$sourceExpr as String';
    if (_isBool(type)) return '$sourceExpr as bool';
    if (_isInt(type)) return '($sourceExpr as num).toInt()';
    if (_isDouble(type)) return '($sourceExpr as num).toDouble()';
    if (_isDateTime(type)) return 'DateTime.parse($sourceExpr as String)';
    if (_isEnum(type)) return '${type.baseName}.values.byName($sourceExpr as String)';
    if (_isIdLike(type)) return '${type.baseName}.fromJson($sourceExpr as String)';
    if (_isGeneratedImmutable(type)) {
      return '${type.baseName}.fromJson($sourceExpr as Map<String, dynamic>)';
    }

    return '$sourceExpr as ${type.render()}';
  }

  String _fromJsonKeyExpr(_ResolvedType type, String sourceExpr) {
    if (_isString(type)) return sourceExpr;
    if (_isIdLike(type)) return '${type.baseName}.fromJson($sourceExpr)';
    return '$sourceExpr as ${type.render()}';
  }

  String _fromJsonValueExpr(_ResolvedType type, String sourceExpr) {
    return _fromJsonExpr(type, sourceExpr);
  }

  String _toJsonExpr(_ResolvedType type, String sourceExpr) {
    if (type.isNullable) {
      final nonNull = type.nonNullable();

      if (nonNull.kind == _TypeKind.map) {
        final keyType = nonNull.args[0];
        final valueType = nonNull.args[1];
        return '$sourceExpr?.toJson('
            'toJsonK: (key) => ${_toJsonKeyExpr(keyType, 'key')}, '
            'toJsonV: (value) => ${_toJsonValueExpr(valueType, 'value')}'
            ')';
      }

      if (nonNull.kind == _TypeKind.list) {
        final itemType = nonNull.args.single;
        return '$sourceExpr?.toJson((item) => ${_toJsonValueExpr(itemType, 'item')})';
      }

      if (_isDateTime(nonNull)) return '$sourceExpr?.toIso8601String()';
      if (_isEnum(nonNull)) return '$sourceExpr?.name';
      if (_isIdLike(nonNull)) return '$sourceExpr?.toJson()';
      if (_isGeneratedImmutable(nonNull)) return '$sourceExpr?.toJson()';

      return sourceExpr;
    }

    if (type.kind == _TypeKind.map) {
      final keyType = type.args[0];
      final valueType = type.args[1];
      return '$sourceExpr.toJson('
          'toJsonK: (key) => ${_toJsonKeyExpr(keyType, 'key')}, '
          'toJsonV: (value) => ${_toJsonValueExpr(valueType, 'value')}'
          ')';
    }

    if (type.kind == _TypeKind.list) {
      final itemType = type.args.single;
      return '$sourceExpr.toJson((item) => ${_toJsonValueExpr(itemType, 'item')})';
    }

    if (_isDateTime(type)) return '$sourceExpr.toIso8601String()';
    if (_isEnum(type)) return '$sourceExpr.name';
    if (_isIdLike(type)) return '$sourceExpr.toJson()';
    if (_isGeneratedImmutable(type)) return '$sourceExpr.toJson()';

    return sourceExpr;
  }

  String _toJsonKeyExpr(_ResolvedType type, String sourceExpr) {
    if (_isString(type)) return sourceExpr;
    if (_isIdLike(type)) return '$sourceExpr.toJson()';
    return sourceExpr;
  }

  String _toJsonValueExpr(_ResolvedType type, String sourceExpr) {
    return _toJsonExpr(type, sourceExpr);
  }

  String _immutableToMutableExprForField(_FieldInfo field, String sourceExpr) {
    if (field.isImmutableField) return sourceExpr;
    return _immutableToMutableExpr(_immutableShape(field.type), sourceExpr);
  }

  String _mutableToImmutableExprForField(_FieldInfo field, String sourceExpr) {
    if (field.isImmutableField) return sourceExpr;
    return _mutableToImmutableExpr(_mutableShape(field.type), sourceExpr);
  }

  String _immutableToMutableExpr(_ResolvedType type, String sourceExpr) {
    if (type.isNullable) {
      final nonNull = type.nonNullable();

      if (nonNull.kind == _TypeKind.map) {
        final keyType = nonNull.args[0];
        final valueType = nonNull.args[1];
        return '$sourceExpr?.mapToPlainMap('
            '(k, v) => MapEntry('
            '${_immutableNestedToMutable(keyType, 'k')}, '
            '${_immutableNestedToMutable(valueType, 'v')}'
            '))';
      }

      if (nonNull.kind == _TypeKind.list) {
        final itemType = nonNull.args.single;
        return '$sourceExpr?.mapToMutableList((x) => ${_immutableNestedToMutable(itemType, 'x')})';
      }

      if (_isGeneratedImmutable(nonNull)) return '$sourceExpr?.toMutable()';

      return sourceExpr;
    }

    if (type.kind == _TypeKind.map) {
      final keyType = type.args[0];
      final valueType = type.args[1];
      return '$sourceExpr.mapToPlainMap('
          '(k, v) => MapEntry('
          '${_immutableNestedToMutable(keyType, 'k')}, '
          '${_immutableNestedToMutable(valueType, 'v')}'
          '))';
    }

    if (type.kind == _TypeKind.list) {
      final itemType = type.args.single;
      return '$sourceExpr.mapToMutableList((x) => ${_immutableNestedToMutable(itemType, 'x')})';
    }

    if (_isGeneratedImmutable(type)) return '$sourceExpr.toMutable()';
    return sourceExpr;
  }

  String _mutableToImmutableExpr(_ResolvedType type, String sourceExpr) {
    if (type.isNullable) {
      final nonNull = type.nonNullable();

      if (nonNull.kind == _TypeKind.map) {
        final keyType = nonNull.args[0];
        final valueType = nonNull.args[1];
        return '$sourceExpr == null ? null : ImmutableMap.of('
            '$sourceExpr.map((k, v) => MapEntry('
            '${_mutableNestedToImmutable(keyType, 'k')}, '
            '${_mutableNestedToImmutable(valueType, 'v')}'
            ')))';
      }

      if (nonNull.kind == _TypeKind.list) {
        final itemType = nonNull.args.single;
        return '$sourceExpr?.mapToImmutableList((x) => ${_mutableNestedToImmutable(itemType, 'x')})';
      }

      if (_isGeneratedMutable(nonNull)) return '$sourceExpr?.toImmutable()';

      return sourceExpr;
    }

    if (type.kind == _TypeKind.map) {
      final keyType = type.args[0];
      final valueType = type.args[1];
      return 'ImmutableMap.of('
          '$sourceExpr.map((k, v) => MapEntry('
          '${_mutableNestedToImmutable(keyType, 'k')}, '
          '${_mutableNestedToImmutable(valueType, 'v')}'
          ')))';
    }

    if (type.kind == _TypeKind.list) {
      final itemType = type.args.single;
      return '$sourceExpr.mapToImmutableList((x) => ${_mutableNestedToImmutable(itemType, 'x')})';
    }

    if (_isGeneratedMutable(type)) return '$sourceExpr.toImmutable()';
    return sourceExpr;
  }

  String _immutableNestedToMutable(_ResolvedType type, String sourceExpr) {
    if (_isGeneratedImmutable(type)) return '$sourceExpr.toMutable()';
    return sourceExpr;
  }

  String _mutableNestedToImmutable(_ResolvedType type, String sourceExpr) {
    if (_isGeneratedMutable(type)) return '$sourceExpr.toImmutable()';
    return sourceExpr;
  }

  bool _isString(_ResolvedType type) => type.baseName == 'String';

  bool _isBool(_ResolvedType type) => type.baseName == 'bool';

  bool _isInt(_ResolvedType type) => type.baseName == 'int';

  bool _isDouble(_ResolvedType type) => type.baseName == 'double';

  bool _isDateTime(_ResolvedType type) => type.baseName == 'DateTime';

  bool _isEnum(_ResolvedType type) {
    return !type.baseName.startsWith('Immutable') &&
        !type.baseName.startsWith('Mutable') &&
        !_isIdLike(type) &&
        !_isString(type) &&
        !_isBool(type) &&
        !_isInt(type) &&
        !_isDouble(type) &&
        !_isDateTime(type) &&
        type.kind == _TypeKind.simple &&
        type.baseName[0] == type.baseName[0].toUpperCase() &&
        !type.baseName.endsWith('Data') &&
        !type.baseName.endsWith('Changes');
  }

  bool _isIdLike(_ResolvedType type) => type.baseName.endsWith('Id');

  bool _isGeneratedImmutable(_ResolvedType type) =>
      type.baseName.startsWith('Immutable') &&
      (type.baseName.endsWith('Data') || type.baseName.endsWith('Changes'));

  bool _isGeneratedMutable(_ResolvedType type) =>
      type.baseName.startsWith('Mutable') &&
      (type.baseName.endsWith('Data') || type.baseName.endsWith('Changes'));
}

enum _Mode { immutable, mutable }

enum _TypeKind { simple, list, map }

class _FieldInfo {
  final String name;
  final DartType type;
  final bool isImmutableField;

  _FieldInfo({required this.name, required this.type, required this.isImmutableField});
}

class _ResolvedType {
  final _TypeKind kind;
  final String baseName;
  final List<_ResolvedType> args;
  final bool isNullable;

  _ResolvedType.simple({required this.baseName, required this.isNullable})
    : kind = _TypeKind.simple,
      args = const [];

  _ResolvedType.list({required this.baseName, required this.args, required this.isNullable})
    : kind = _TypeKind.list;

  _ResolvedType.map({required this.baseName, required this.args, required this.isNullable})
    : kind = _TypeKind.map;

  String render() {
    final suffix = isNullable ? '?' : '';
    if (args.isEmpty) return '$baseName$suffix';
    return '$baseName<${args.map((x) => x.render()).join(', ')}>$suffix';
  }

  _ResolvedType nonNullable() {
    if (!isNullable) return this;

    switch (kind) {
      case _TypeKind.simple:
        return _ResolvedType.simple(baseName: baseName, isNullable: false);
      case _TypeKind.list:
        return _ResolvedType.list(baseName: baseName, args: args, isNullable: false);
      case _TypeKind.map:
        return _ResolvedType.map(baseName: baseName, args: args, isNullable: false);
    }
  }
}

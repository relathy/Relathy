import 'package:rrf/src/errors.dart';
import 'package:rrf/src/message.dart';

class ResultJsonConverter {
  final Type type;
  dynamic Function(dynamic object) toJson;
  dynamic Function(dynamic object) fromJson;
  ResultJsonConverter._({required this.type, required this.toJson, required this.fromJson});

  static ResultJsonConverter create<T>(
    T Function(dynamic object) fromJson,
    dynamic Function(T object) toJson,
  ) {
    return ResultJsonConverter._(type: T, fromJson: fromJson, toJson: (x) => toJson(x));
  }
}

class ResultJsonConverterCollection {
  final Map<Type, ResultJsonConverter> _map;

  ResultJsonConverterCollection(List<ResultJsonConverter> pointers)
    : _map = {for (final p in pointers) p.type: p};

  dynamic toJson(Type type, dynamic object) => _map[type]!.toJson(object);
  dynamic fromJson(Type type, dynamic object) => _map[type]!.fromJson(object);
}

class TypeJsonConverter {
  final Type type;
  dynamic Function(dynamic object) fromJson;
  TypeJsonConverter._({required this.type, required this.fromJson});

  static TypeJsonConverter create<T>(T Function(dynamic object) fromJson) {
    return TypeJsonConverter._(type: T, fromJson: fromJson);
  }
}

class TypeJsonConverterCollection {
  final Map<String, TypeJsonConverter> _map;

  TypeJsonConverterCollection(List<TypeJsonConverter> pointers)
    : _map = {for (final p in pointers) p.type.toString(): p};

  dynamic fromJson(String type, dynamic object) => _map[type]!.fromJson(object);
}

class MessageDtoJsonConverter {
  final ResultJsonConverterCollection _resultJsonConverterCollection;
  final TypeJsonConverterCollection _exceptionJsonConverterCollection;
  final TypeJsonConverterCollection _messageJsonConverterCollection;

  MessageDtoJsonConverter({
    required TypeJsonConverterCollection messageJsonConverterCollection,
    required ResultJsonConverterCollection resultJsonConverterCollection,
    required TypeJsonConverterCollection exceptionJsonConverterCollection,
  }) : _resultJsonConverterCollection = resultJsonConverterCollection,
       _messageJsonConverterCollection = messageJsonConverterCollection,
       _exceptionJsonConverterCollection = exceptionJsonConverterCollection;

  Map<String, dynamic> messageToJson(Message message) {
    final json = message.toJson();
    json["type"] = message.runtimeType.toString();
    return json;
  }

  Message messageFromJson(Map<String, dynamic> json) {
    final type = json["type"] as String;
    return _messageJsonConverterCollection.fromJson(type, json);
  }

  Map<String, dynamic> responseToJson(Request request, Response response) {
    if (response.isSuccess) {
      return <String, dynamic>{
        'Value': request.getResultType().toString() == "void"
            ? null
            : _resultJsonConverterCollection.toJson(request.getResultType(), response.getValue()),
      };
    } else {
      final error = response.getError();
      return <String, dynamic>{'Error': error.toJson()};
    }
  }

  Response responseFromJson(Request request, Map<String, dynamic> json) {
    final visitor = _RequestVisitor(this, json);
    request.acceptVisitor(visitor);
    return visitor.response;
  }
}

class _RequestVisitor implements RequestVisitor {
  late Response response;
  final Map<String, dynamic> json;
  final MessageDtoJsonConverter converter;
  _RequestVisitor(this.converter, this.json);

  @override
  void visit<TRequest extends Request<TResult>, TResult>(TRequest request) {
    response = json["Error"] != null
        ? FailureResponse<TResult>(_mapExceptionFromJson(json['Error']))
        : (json["Value"] != null
              ? SuccessResponse<TResult>(
                  converter._resultJsonConverterCollection.fromJson(request.getResultType(), json["Value"]),
                )
              : SuccessResponse<TResult>((null as dynamic)));
  }

  AppError _mapExceptionFromJson(Map<String, dynamic> json) {
    final type = json["type"] as String;
    return converter._exceptionJsonConverterCollection.fromJson(type, json);
  }
}

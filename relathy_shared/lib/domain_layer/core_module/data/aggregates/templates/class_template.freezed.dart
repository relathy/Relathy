// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'class_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClassTemplate {

 WebObject get classObject; DisplayName get label; List<PropertyTypeTemplate> get propertyTypeTemplates;







}




/// Adds pattern-matching-related methods to [ClassTemplate].
extension ClassTemplatePatterns on ClassTemplate {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TypeTemplate value)?  typeTemplate,TResult Function( MixinTemplate value)?  mixinTemplate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TypeTemplate() when typeTemplate != null:
return typeTemplate(_that);case MixinTemplate() when mixinTemplate != null:
return mixinTemplate(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TypeTemplate value)  typeTemplate,required TResult Function( MixinTemplate value)  mixinTemplate,}){
final _that = this;
switch (_that) {
case TypeTemplate():
return typeTemplate(_that);case MixinTemplate():
return mixinTemplate(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TypeTemplate value)?  typeTemplate,TResult? Function( MixinTemplate value)?  mixinTemplate,}){
final _that = this;
switch (_that) {
case TypeTemplate() when typeTemplate != null:
return typeTemplate(_that);case MixinTemplate() when mixinTemplate != null:
return mixinTemplate(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( WebObject classObject,  DisplayName label,  List<PropertyTypeTemplate> propertyTypeTemplates)?  typeTemplate,TResult Function( WebObject classObject,  DisplayName label,  List<PropertyTypeTemplate> propertyTypeTemplates)?  mixinTemplate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TypeTemplate() when typeTemplate != null:
return typeTemplate(_that.classObject,_that.label,_that.propertyTypeTemplates);case MixinTemplate() when mixinTemplate != null:
return mixinTemplate(_that.classObject,_that.label,_that.propertyTypeTemplates);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( WebObject classObject,  DisplayName label,  List<PropertyTypeTemplate> propertyTypeTemplates)  typeTemplate,required TResult Function( WebObject classObject,  DisplayName label,  List<PropertyTypeTemplate> propertyTypeTemplates)  mixinTemplate,}) {final _that = this;
switch (_that) {
case TypeTemplate():
return typeTemplate(_that.classObject,_that.label,_that.propertyTypeTemplates);case MixinTemplate():
return mixinTemplate(_that.classObject,_that.label,_that.propertyTypeTemplates);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( WebObject classObject,  DisplayName label,  List<PropertyTypeTemplate> propertyTypeTemplates)?  typeTemplate,TResult? Function( WebObject classObject,  DisplayName label,  List<PropertyTypeTemplate> propertyTypeTemplates)?  mixinTemplate,}) {final _that = this;
switch (_that) {
case TypeTemplate() when typeTemplate != null:
return typeTemplate(_that.classObject,_that.label,_that.propertyTypeTemplates);case MixinTemplate() when mixinTemplate != null:
return mixinTemplate(_that.classObject,_that.label,_that.propertyTypeTemplates);case _:
  return null;

}
}

}

/// @nodoc


class TypeTemplate extends ClassTemplate {
  const TypeTemplate({required this.classObject, required this.label, required final  List<PropertyTypeTemplate> propertyTypeTemplates}): _propertyTypeTemplates = propertyTypeTemplates,super._();
  

@override final  WebObject classObject;
@override final  DisplayName label;
 final  List<PropertyTypeTemplate> _propertyTypeTemplates;
@override List<PropertyTypeTemplate> get propertyTypeTemplates {
  if (_propertyTypeTemplates is EqualUnmodifiableListView) return _propertyTypeTemplates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_propertyTypeTemplates);
}









}




/// @nodoc


class MixinTemplate extends ClassTemplate {
  const MixinTemplate({required this.classObject, required this.label, required final  List<PropertyTypeTemplate> propertyTypeTemplates}): _propertyTypeTemplates = propertyTypeTemplates,super._();
  

@override final  WebObject classObject;
@override final  DisplayName label;
 final  List<PropertyTypeTemplate> _propertyTypeTemplates;
@override List<PropertyTypeTemplate> get propertyTypeTemplates {
  if (_propertyTypeTemplates is EqualUnmodifiableListView) return _propertyTypeTemplates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_propertyTypeTemplates);
}









}




// dart format on

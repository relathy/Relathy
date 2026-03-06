// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ObjectId {

 String get value;
/// Create a copy of ObjectId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ObjectIdCopyWith<ObjectId> get copyWith => _$ObjectIdCopyWithImpl<ObjectId>(this as ObjectId, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ObjectId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);



}

/// @nodoc
abstract mixin class $ObjectIdCopyWith<$Res>  {
  factory $ObjectIdCopyWith(ObjectId value, $Res Function(ObjectId) _then) = _$ObjectIdCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$ObjectIdCopyWithImpl<$Res>
    implements $ObjectIdCopyWith<$Res> {
  _$ObjectIdCopyWithImpl(this._self, this._then);

  final ObjectId _self;
  final $Res Function(ObjectId) _then;

/// Create a copy of ObjectId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ObjectId].
extension ObjectIdPatterns on ObjectId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ObjectId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ObjectId() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ObjectId value)  $default,){
final _that = this;
switch (_that) {
case _ObjectId():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ObjectId value)?  $default,){
final _that = this;
switch (_that) {
case _ObjectId() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ObjectId() when $default != null:
return $default(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value)  $default,) {final _that = this;
switch (_that) {
case _ObjectId():
return $default(_that.value);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value)?  $default,) {final _that = this;
switch (_that) {
case _ObjectId() when $default != null:
return $default(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _ObjectId extends ObjectId {
  const _ObjectId(this.value): super._();
  

@override final  String value;

/// Create a copy of ObjectId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ObjectIdCopyWith<_ObjectId> get copyWith => __$ObjectIdCopyWithImpl<_ObjectId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ObjectId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);



}

/// @nodoc
abstract mixin class _$ObjectIdCopyWith<$Res> implements $ObjectIdCopyWith<$Res> {
  factory _$ObjectIdCopyWith(_ObjectId value, $Res Function(_ObjectId) _then) = __$ObjectIdCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class __$ObjectIdCopyWithImpl<$Res>
    implements _$ObjectIdCopyWith<$Res> {
  __$ObjectIdCopyWithImpl(this._self, this._then);

  final _ObjectId _self;
  final $Res Function(_ObjectId) _then;

/// Create a copy of ObjectId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_ObjectId(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ToolId {

 String get value;
/// Create a copy of ToolId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToolIdCopyWith<ToolId> get copyWith => _$ToolIdCopyWithImpl<ToolId>(this as ToolId, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToolId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ToolId(value: $value)';
}


}

/// @nodoc
abstract mixin class $ToolIdCopyWith<$Res>  {
  factory $ToolIdCopyWith(ToolId value, $Res Function(ToolId) _then) = _$ToolIdCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$ToolIdCopyWithImpl<$Res>
    implements $ToolIdCopyWith<$Res> {
  _$ToolIdCopyWithImpl(this._self, this._then);

  final ToolId _self;
  final $Res Function(ToolId) _then;

/// Create a copy of ToolId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ToolId].
extension ToolIdPatterns on ToolId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToolId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolId() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToolId value)  $default,){
final _that = this;
switch (_that) {
case _ToolId():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToolId value)?  $default,){
final _that = this;
switch (_that) {
case _ToolId() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolId() when $default != null:
return $default(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value)  $default,) {final _that = this;
switch (_that) {
case _ToolId():
return $default(_that.value);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value)?  $default,) {final _that = this;
switch (_that) {
case _ToolId() when $default != null:
return $default(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _ToolId extends ToolId {
  const _ToolId(this.value): super._();
  

@override final  String value;

/// Create a copy of ToolId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolIdCopyWith<_ToolId> get copyWith => __$ToolIdCopyWithImpl<_ToolId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ToolId(value: $value)';
}


}

/// @nodoc
abstract mixin class _$ToolIdCopyWith<$Res> implements $ToolIdCopyWith<$Res> {
  factory _$ToolIdCopyWith(_ToolId value, $Res Function(_ToolId) _then) = __$ToolIdCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class __$ToolIdCopyWithImpl<$Res>
    implements _$ToolIdCopyWith<$Res> {
  __$ToolIdCopyWithImpl(this._self, this._then);

  final _ToolId _self;
  final $Res Function(_ToolId) _then;

/// Create a copy of ToolId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_ToolId(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

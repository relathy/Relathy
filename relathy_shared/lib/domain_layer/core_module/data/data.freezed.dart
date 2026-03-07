// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserId {

 String get value;
/// Create a copy of UserId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserIdCopyWith<UserId> get copyWith => _$UserIdCopyWithImpl<UserId>(this as UserId, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'UserId(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserIdCopyWith<$Res>  {
  factory $UserIdCopyWith(UserId value, $Res Function(UserId) _then) = _$UserIdCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserIdCopyWithImpl<$Res>
    implements $UserIdCopyWith<$Res> {
  _$UserIdCopyWithImpl(this._self, this._then);

  final UserId _self;
  final $Res Function(UserId) _then;

/// Create a copy of UserId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserId].
extension UserIdPatterns on UserId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserId() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserId value)  $default,){
final _that = this;
switch (_that) {
case _UserId():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserId value)?  $default,){
final _that = this;
switch (_that) {
case _UserId() when $default != null:
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
case _UserId() when $default != null:
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
case _UserId():
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
case _UserId() when $default != null:
return $default(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _UserId extends UserId {
  const _UserId(this.value): super._();
  

@override final  String value;

/// Create a copy of UserId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserIdCopyWith<_UserId> get copyWith => __$UserIdCopyWithImpl<_UserId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'UserId(value: $value)';
}


}

/// @nodoc
abstract mixin class _$UserIdCopyWith<$Res> implements $UserIdCopyWith<$Res> {
  factory _$UserIdCopyWith(_UserId value, $Res Function(_UserId) _then) = __$UserIdCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class __$UserIdCopyWithImpl<$Res>
    implements _$UserIdCopyWith<$Res> {
  __$UserIdCopyWithImpl(this._self, this._then);

  final _UserId _self;
  final $Res Function(_UserId) _then;

/// Create a copy of UserId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_UserId(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RelationshipId {

 String get value;
/// Create a copy of RelationshipId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RelationshipIdCopyWith<RelationshipId> get copyWith => _$RelationshipIdCopyWithImpl<RelationshipId>(this as RelationshipId, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RelationshipId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'RelationshipId(value: $value)';
}


}

/// @nodoc
abstract mixin class $RelationshipIdCopyWith<$Res>  {
  factory $RelationshipIdCopyWith(RelationshipId value, $Res Function(RelationshipId) _then) = _$RelationshipIdCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$RelationshipIdCopyWithImpl<$Res>
    implements $RelationshipIdCopyWith<$Res> {
  _$RelationshipIdCopyWithImpl(this._self, this._then);

  final RelationshipId _self;
  final $Res Function(RelationshipId) _then;

/// Create a copy of RelationshipId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RelationshipId].
extension RelationshipIdPatterns on RelationshipId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RelationshipId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RelationshipId() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RelationshipId value)  $default,){
final _that = this;
switch (_that) {
case _RelationshipId():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RelationshipId value)?  $default,){
final _that = this;
switch (_that) {
case _RelationshipId() when $default != null:
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
case _RelationshipId() when $default != null:
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
case _RelationshipId():
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
case _RelationshipId() when $default != null:
return $default(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _RelationshipId extends RelationshipId {
  const _RelationshipId(this.value): super._();
  

@override final  String value;

/// Create a copy of RelationshipId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RelationshipIdCopyWith<_RelationshipId> get copyWith => __$RelationshipIdCopyWithImpl<_RelationshipId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RelationshipId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'RelationshipId(value: $value)';
}


}

/// @nodoc
abstract mixin class _$RelationshipIdCopyWith<$Res> implements $RelationshipIdCopyWith<$Res> {
  factory _$RelationshipIdCopyWith(_RelationshipId value, $Res Function(_RelationshipId) _then) = __$RelationshipIdCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class __$RelationshipIdCopyWithImpl<$Res>
    implements _$RelationshipIdCopyWith<$Res> {
  __$RelationshipIdCopyWithImpl(this._self, this._then);

  final _RelationshipId _self;
  final $Res Function(_RelationshipId) _then;

/// Create a copy of RelationshipId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_RelationshipId(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$MemberId {

 String get value;
/// Create a copy of MemberId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberIdCopyWith<MemberId> get copyWith => _$MemberIdCopyWithImpl<MemberId>(this as MemberId, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'MemberId(value: $value)';
}


}

/// @nodoc
abstract mixin class $MemberIdCopyWith<$Res>  {
  factory $MemberIdCopyWith(MemberId value, $Res Function(MemberId) _then) = _$MemberIdCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$MemberIdCopyWithImpl<$Res>
    implements $MemberIdCopyWith<$Res> {
  _$MemberIdCopyWithImpl(this._self, this._then);

  final MemberId _self;
  final $Res Function(MemberId) _then;

/// Create a copy of MemberId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberId].
extension MemberIdPatterns on MemberId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberId() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberId value)  $default,){
final _that = this;
switch (_that) {
case _MemberId():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberId value)?  $default,){
final _that = this;
switch (_that) {
case _MemberId() when $default != null:
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
case _MemberId() when $default != null:
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
case _MemberId():
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
case _MemberId() when $default != null:
return $default(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _MemberId extends MemberId {
  const _MemberId(this.value): super._();
  

@override final  String value;

/// Create a copy of MemberId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberIdCopyWith<_MemberId> get copyWith => __$MemberIdCopyWithImpl<_MemberId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'MemberId(value: $value)';
}


}

/// @nodoc
abstract mixin class _$MemberIdCopyWith<$Res> implements $MemberIdCopyWith<$Res> {
  factory _$MemberIdCopyWith(_MemberId value, $Res Function(_MemberId) _then) = __$MemberIdCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class __$MemberIdCopyWithImpl<$Res>
    implements _$MemberIdCopyWith<$Res> {
  __$MemberIdCopyWithImpl(this._self, this._then);

  final _MemberId _self;
  final $Res Function(_MemberId) _then;

/// Create a copy of MemberId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_MemberId(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$EssentialId {

 String get value;
/// Create a copy of EssentialId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EssentialIdCopyWith<EssentialId> get copyWith => _$EssentialIdCopyWithImpl<EssentialId>(this as EssentialId, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EssentialId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'EssentialId(value: $value)';
}


}

/// @nodoc
abstract mixin class $EssentialIdCopyWith<$Res>  {
  factory $EssentialIdCopyWith(EssentialId value, $Res Function(EssentialId) _then) = _$EssentialIdCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$EssentialIdCopyWithImpl<$Res>
    implements $EssentialIdCopyWith<$Res> {
  _$EssentialIdCopyWithImpl(this._self, this._then);

  final EssentialId _self;
  final $Res Function(EssentialId) _then;

/// Create a copy of EssentialId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EssentialId].
extension EssentialIdPatterns on EssentialId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EssentialId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EssentialId() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EssentialId value)  $default,){
final _that = this;
switch (_that) {
case _EssentialId():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EssentialId value)?  $default,){
final _that = this;
switch (_that) {
case _EssentialId() when $default != null:
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
case _EssentialId() when $default != null:
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
case _EssentialId():
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
case _EssentialId() when $default != null:
return $default(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _EssentialId extends EssentialId {
  const _EssentialId(this.value): super._();
  

@override final  String value;

/// Create a copy of EssentialId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EssentialIdCopyWith<_EssentialId> get copyWith => __$EssentialIdCopyWithImpl<_EssentialId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EssentialId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'EssentialId(value: $value)';
}


}

/// @nodoc
abstract mixin class _$EssentialIdCopyWith<$Res> implements $EssentialIdCopyWith<$Res> {
  factory _$EssentialIdCopyWith(_EssentialId value, $Res Function(_EssentialId) _then) = __$EssentialIdCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class __$EssentialIdCopyWithImpl<$Res>
    implements _$EssentialIdCopyWith<$Res> {
  __$EssentialIdCopyWithImpl(this._self, this._then);

  final _EssentialId _self;
  final $Res Function(_EssentialId) _then;

/// Create a copy of EssentialId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_EssentialId(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PreferenceId {

 String get value;
/// Create a copy of PreferenceId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferenceIdCopyWith<PreferenceId> get copyWith => _$PreferenceIdCopyWithImpl<PreferenceId>(this as PreferenceId, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferenceId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PreferenceId(value: $value)';
}


}

/// @nodoc
abstract mixin class $PreferenceIdCopyWith<$Res>  {
  factory $PreferenceIdCopyWith(PreferenceId value, $Res Function(PreferenceId) _then) = _$PreferenceIdCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$PreferenceIdCopyWithImpl<$Res>
    implements $PreferenceIdCopyWith<$Res> {
  _$PreferenceIdCopyWithImpl(this._self, this._then);

  final PreferenceId _self;
  final $Res Function(PreferenceId) _then;

/// Create a copy of PreferenceId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PreferenceId].
extension PreferenceIdPatterns on PreferenceId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreferenceId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreferenceId() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreferenceId value)  $default,){
final _that = this;
switch (_that) {
case _PreferenceId():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreferenceId value)?  $default,){
final _that = this;
switch (_that) {
case _PreferenceId() when $default != null:
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
case _PreferenceId() when $default != null:
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
case _PreferenceId():
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
case _PreferenceId() when $default != null:
return $default(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _PreferenceId extends PreferenceId {
  const _PreferenceId(this.value): super._();
  

@override final  String value;

/// Create a copy of PreferenceId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreferenceIdCopyWith<_PreferenceId> get copyWith => __$PreferenceIdCopyWithImpl<_PreferenceId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreferenceId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PreferenceId(value: $value)';
}


}

/// @nodoc
abstract mixin class _$PreferenceIdCopyWith<$Res> implements $PreferenceIdCopyWith<$Res> {
  factory _$PreferenceIdCopyWith(_PreferenceId value, $Res Function(_PreferenceId) _then) = __$PreferenceIdCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class __$PreferenceIdCopyWithImpl<$Res>
    implements _$PreferenceIdCopyWith<$Res> {
  __$PreferenceIdCopyWithImpl(this._self, this._then);

  final _PreferenceId _self;
  final $Res Function(_PreferenceId) _then;

/// Create a copy of PreferenceId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_PreferenceId(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$AgreementId {

 String get value;
/// Create a copy of AgreementId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgreementIdCopyWith<AgreementId> get copyWith => _$AgreementIdCopyWithImpl<AgreementId>(this as AgreementId, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgreementId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AgreementId(value: $value)';
}


}

/// @nodoc
abstract mixin class $AgreementIdCopyWith<$Res>  {
  factory $AgreementIdCopyWith(AgreementId value, $Res Function(AgreementId) _then) = _$AgreementIdCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$AgreementIdCopyWithImpl<$Res>
    implements $AgreementIdCopyWith<$Res> {
  _$AgreementIdCopyWithImpl(this._self, this._then);

  final AgreementId _self;
  final $Res Function(AgreementId) _then;

/// Create a copy of AgreementId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AgreementId].
extension AgreementIdPatterns on AgreementId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgreementId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgreementId() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgreementId value)  $default,){
final _that = this;
switch (_that) {
case _AgreementId():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgreementId value)?  $default,){
final _that = this;
switch (_that) {
case _AgreementId() when $default != null:
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
case _AgreementId() when $default != null:
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
case _AgreementId():
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
case _AgreementId() when $default != null:
return $default(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _AgreementId extends AgreementId {
  const _AgreementId(this.value): super._();
  

@override final  String value;

/// Create a copy of AgreementId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgreementIdCopyWith<_AgreementId> get copyWith => __$AgreementIdCopyWithImpl<_AgreementId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgreementId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AgreementId(value: $value)';
}


}

/// @nodoc
abstract mixin class _$AgreementIdCopyWith<$Res> implements $AgreementIdCopyWith<$Res> {
  factory _$AgreementIdCopyWith(_AgreementId value, $Res Function(_AgreementId) _then) = __$AgreementIdCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class __$AgreementIdCopyWithImpl<$Res>
    implements _$AgreementIdCopyWith<$Res> {
  __$AgreementIdCopyWithImpl(this._self, this._then);

  final _AgreementId _self;
  final $Res Function(_AgreementId) _then;

/// Create a copy of AgreementId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_AgreementId(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$RequestId {

 String get value;
/// Create a copy of RequestId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestIdCopyWith<RequestId> get copyWith => _$RequestIdCopyWithImpl<RequestId>(this as RequestId, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'RequestId(value: $value)';
}


}

/// @nodoc
abstract mixin class $RequestIdCopyWith<$Res>  {
  factory $RequestIdCopyWith(RequestId value, $Res Function(RequestId) _then) = _$RequestIdCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$RequestIdCopyWithImpl<$Res>
    implements $RequestIdCopyWith<$Res> {
  _$RequestIdCopyWithImpl(this._self, this._then);

  final RequestId _self;
  final $Res Function(RequestId) _then;

/// Create a copy of RequestId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestId].
extension RequestIdPatterns on RequestId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestId() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestId value)  $default,){
final _that = this;
switch (_that) {
case _RequestId():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestId value)?  $default,){
final _that = this;
switch (_that) {
case _RequestId() when $default != null:
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
case _RequestId() when $default != null:
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
case _RequestId():
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
case _RequestId() when $default != null:
return $default(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _RequestId extends RequestId {
  const _RequestId(this.value): super._();
  

@override final  String value;

/// Create a copy of RequestId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestIdCopyWith<_RequestId> get copyWith => __$RequestIdCopyWithImpl<_RequestId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestId&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'RequestId(value: $value)';
}


}

/// @nodoc
abstract mixin class _$RequestIdCopyWith<$Res> implements $RequestIdCopyWith<$Res> {
  factory _$RequestIdCopyWith(_RequestId value, $Res Function(_RequestId) _then) = __$RequestIdCopyWithImpl;
@override @useResult
$Res call({
 String value
});




}
/// @nodoc
class __$RequestIdCopyWithImpl<$Res>
    implements _$RequestIdCopyWith<$Res> {
  __$RequestIdCopyWithImpl(this._self, this._then);

  final _RequestId _self;
  final $Res Function(_RequestId) _then;

/// Create a copy of RequestId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_RequestId(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

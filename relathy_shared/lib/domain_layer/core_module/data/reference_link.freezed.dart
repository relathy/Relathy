// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reference_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReferenceLink {

 Uri get uri;
/// Create a copy of ReferenceLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferenceLinkCopyWith<ReferenceLink> get copyWith => _$ReferenceLinkCopyWithImpl<ReferenceLink>(this as ReferenceLink, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferenceLink&&(identical(other.uri, uri) || other.uri == uri));
}


@override
int get hashCode => Object.hash(runtimeType,uri);



}

/// @nodoc
abstract mixin class $ReferenceLinkCopyWith<$Res>  {
  factory $ReferenceLinkCopyWith(ReferenceLink value, $Res Function(ReferenceLink) _then) = _$ReferenceLinkCopyWithImpl;
@useResult
$Res call({
 Uri uri
});




}
/// @nodoc
class _$ReferenceLinkCopyWithImpl<$Res>
    implements $ReferenceLinkCopyWith<$Res> {
  _$ReferenceLinkCopyWithImpl(this._self, this._then);

  final ReferenceLink _self;
  final $Res Function(ReferenceLink) _then;

/// Create a copy of ReferenceLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uri = null,}) {
  return _then(_self.copyWith(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferenceLink].
extension ReferenceLinkPatterns on ReferenceLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferenceLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferenceLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferenceLink value)  $default,){
final _that = this;
switch (_that) {
case _ReferenceLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferenceLink value)?  $default,){
final _that = this;
switch (_that) {
case _ReferenceLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uri uri)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferenceLink() when $default != null:
return $default(_that.uri);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uri uri)  $default,) {final _that = this;
switch (_that) {
case _ReferenceLink():
return $default(_that.uri);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uri uri)?  $default,) {final _that = this;
switch (_that) {
case _ReferenceLink() when $default != null:
return $default(_that.uri);case _:
  return null;

}
}

}

/// @nodoc


class _ReferenceLink extends ReferenceLink {
  const _ReferenceLink(this.uri): super._();
  

@override final  Uri uri;

/// Create a copy of ReferenceLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferenceLinkCopyWith<_ReferenceLink> get copyWith => __$ReferenceLinkCopyWithImpl<_ReferenceLink>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferenceLink&&(identical(other.uri, uri) || other.uri == uri));
}


@override
int get hashCode => Object.hash(runtimeType,uri);



}

/// @nodoc
abstract mixin class _$ReferenceLinkCopyWith<$Res> implements $ReferenceLinkCopyWith<$Res> {
  factory _$ReferenceLinkCopyWith(_ReferenceLink value, $Res Function(_ReferenceLink) _then) = __$ReferenceLinkCopyWithImpl;
@override @useResult
$Res call({
 Uri uri
});




}
/// @nodoc
class __$ReferenceLinkCopyWithImpl<$Res>
    implements _$ReferenceLinkCopyWith<$Res> {
  __$ReferenceLinkCopyWithImpl(this._self, this._then);

  final _ReferenceLink _self;
  final $Res Function(_ReferenceLink) _then;

/// Create a copy of ReferenceLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uri = null,}) {
  return _then(_ReferenceLink(
null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as Uri,
  ));
}


}

/// @nodoc
mixin _$ReferenceLinkInfo {

 ReferenceLink get link;
/// Create a copy of ReferenceLinkInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferenceLinkInfoCopyWith<ReferenceLinkInfo> get copyWith => _$ReferenceLinkInfoCopyWithImpl<ReferenceLinkInfo>(this as ReferenceLinkInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferenceLinkInfo&&(identical(other.link, link) || other.link == link));
}


@override
int get hashCode => Object.hash(runtimeType,link);

@override
String toString() {
  return 'ReferenceLinkInfo(link: $link)';
}


}

/// @nodoc
abstract mixin class $ReferenceLinkInfoCopyWith<$Res>  {
  factory $ReferenceLinkInfoCopyWith(ReferenceLinkInfo value, $Res Function(ReferenceLinkInfo) _then) = _$ReferenceLinkInfoCopyWithImpl;
@useResult
$Res call({
 ReferenceLink link
});


$ReferenceLinkCopyWith<$Res> get link;

}
/// @nodoc
class _$ReferenceLinkInfoCopyWithImpl<$Res>
    implements $ReferenceLinkInfoCopyWith<$Res> {
  _$ReferenceLinkInfoCopyWithImpl(this._self, this._then);

  final ReferenceLinkInfo _self;
  final $Res Function(ReferenceLinkInfo) _then;

/// Create a copy of ReferenceLinkInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? link = null,}) {
  return _then(_self.copyWith(
link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as ReferenceLink,
  ));
}
/// Create a copy of ReferenceLinkInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReferenceLinkCopyWith<$Res> get link {
  
  return $ReferenceLinkCopyWith<$Res>(_self.link, (value) {
    return _then(_self.copyWith(link: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReferenceLinkInfo].
extension ReferenceLinkInfoPatterns on ReferenceLinkInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlainReferenceLinkInfo value)?  plainReferenceLinkInfo,TResult Function( ObjectReferenceLinkInfo value)?  objectReferenceLinkInfo,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlainReferenceLinkInfo() when plainReferenceLinkInfo != null:
return plainReferenceLinkInfo(_that);case ObjectReferenceLinkInfo() when objectReferenceLinkInfo != null:
return objectReferenceLinkInfo(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlainReferenceLinkInfo value)  plainReferenceLinkInfo,required TResult Function( ObjectReferenceLinkInfo value)  objectReferenceLinkInfo,}){
final _that = this;
switch (_that) {
case PlainReferenceLinkInfo():
return plainReferenceLinkInfo(_that);case ObjectReferenceLinkInfo():
return objectReferenceLinkInfo(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlainReferenceLinkInfo value)?  plainReferenceLinkInfo,TResult? Function( ObjectReferenceLinkInfo value)?  objectReferenceLinkInfo,}){
final _that = this;
switch (_that) {
case PlainReferenceLinkInfo() when plainReferenceLinkInfo != null:
return plainReferenceLinkInfo(_that);case ObjectReferenceLinkInfo() when objectReferenceLinkInfo != null:
return objectReferenceLinkInfo(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ReferenceLink link,  String referenceUrl)?  plainReferenceLinkInfo,TResult Function( ReferenceLink link,  ObjectId objectId,  ToolId toolId)?  objectReferenceLinkInfo,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlainReferenceLinkInfo() when plainReferenceLinkInfo != null:
return plainReferenceLinkInfo(_that.link,_that.referenceUrl);case ObjectReferenceLinkInfo() when objectReferenceLinkInfo != null:
return objectReferenceLinkInfo(_that.link,_that.objectId,_that.toolId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ReferenceLink link,  String referenceUrl)  plainReferenceLinkInfo,required TResult Function( ReferenceLink link,  ObjectId objectId,  ToolId toolId)  objectReferenceLinkInfo,}) {final _that = this;
switch (_that) {
case PlainReferenceLinkInfo():
return plainReferenceLinkInfo(_that.link,_that.referenceUrl);case ObjectReferenceLinkInfo():
return objectReferenceLinkInfo(_that.link,_that.objectId,_that.toolId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ReferenceLink link,  String referenceUrl)?  plainReferenceLinkInfo,TResult? Function( ReferenceLink link,  ObjectId objectId,  ToolId toolId)?  objectReferenceLinkInfo,}) {final _that = this;
switch (_that) {
case PlainReferenceLinkInfo() when plainReferenceLinkInfo != null:
return plainReferenceLinkInfo(_that.link,_that.referenceUrl);case ObjectReferenceLinkInfo() when objectReferenceLinkInfo != null:
return objectReferenceLinkInfo(_that.link,_that.objectId,_that.toolId);case _:
  return null;

}
}

}

/// @nodoc


class PlainReferenceLinkInfo implements ReferenceLinkInfo {
  const PlainReferenceLinkInfo(this.link, {required this.referenceUrl});
  

@override final  ReferenceLink link;
 final  String referenceUrl;

/// Create a copy of ReferenceLinkInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlainReferenceLinkInfoCopyWith<PlainReferenceLinkInfo> get copyWith => _$PlainReferenceLinkInfoCopyWithImpl<PlainReferenceLinkInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlainReferenceLinkInfo&&(identical(other.link, link) || other.link == link)&&(identical(other.referenceUrl, referenceUrl) || other.referenceUrl == referenceUrl));
}


@override
int get hashCode => Object.hash(runtimeType,link,referenceUrl);

@override
String toString() {
  return 'ReferenceLinkInfo.plainReferenceLinkInfo(link: $link, referenceUrl: $referenceUrl)';
}


}

/// @nodoc
abstract mixin class $PlainReferenceLinkInfoCopyWith<$Res> implements $ReferenceLinkInfoCopyWith<$Res> {
  factory $PlainReferenceLinkInfoCopyWith(PlainReferenceLinkInfo value, $Res Function(PlainReferenceLinkInfo) _then) = _$PlainReferenceLinkInfoCopyWithImpl;
@override @useResult
$Res call({
 ReferenceLink link, String referenceUrl
});


@override $ReferenceLinkCopyWith<$Res> get link;

}
/// @nodoc
class _$PlainReferenceLinkInfoCopyWithImpl<$Res>
    implements $PlainReferenceLinkInfoCopyWith<$Res> {
  _$PlainReferenceLinkInfoCopyWithImpl(this._self, this._then);

  final PlainReferenceLinkInfo _self;
  final $Res Function(PlainReferenceLinkInfo) _then;

/// Create a copy of ReferenceLinkInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? link = null,Object? referenceUrl = null,}) {
  return _then(PlainReferenceLinkInfo(
null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as ReferenceLink,referenceUrl: null == referenceUrl ? _self.referenceUrl : referenceUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ReferenceLinkInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReferenceLinkCopyWith<$Res> get link {
  
  return $ReferenceLinkCopyWith<$Res>(_self.link, (value) {
    return _then(_self.copyWith(link: value));
  });
}
}

/// @nodoc


class ObjectReferenceLinkInfo implements ReferenceLinkInfo {
  const ObjectReferenceLinkInfo(this.link, {required this.objectId, required this.toolId});
  

@override final  ReferenceLink link;
 final  ObjectId objectId;
 final  ToolId toolId;

/// Create a copy of ReferenceLinkInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ObjectReferenceLinkInfoCopyWith<ObjectReferenceLinkInfo> get copyWith => _$ObjectReferenceLinkInfoCopyWithImpl<ObjectReferenceLinkInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ObjectReferenceLinkInfo&&(identical(other.link, link) || other.link == link)&&(identical(other.objectId, objectId) || other.objectId == objectId)&&(identical(other.toolId, toolId) || other.toolId == toolId));
}


@override
int get hashCode => Object.hash(runtimeType,link,objectId,toolId);

@override
String toString() {
  return 'ReferenceLinkInfo.objectReferenceLinkInfo(link: $link, objectId: $objectId, toolId: $toolId)';
}


}

/// @nodoc
abstract mixin class $ObjectReferenceLinkInfoCopyWith<$Res> implements $ReferenceLinkInfoCopyWith<$Res> {
  factory $ObjectReferenceLinkInfoCopyWith(ObjectReferenceLinkInfo value, $Res Function(ObjectReferenceLinkInfo) _then) = _$ObjectReferenceLinkInfoCopyWithImpl;
@override @useResult
$Res call({
 ReferenceLink link, ObjectId objectId, ToolId toolId
});


@override $ReferenceLinkCopyWith<$Res> get link;$ObjectIdCopyWith<$Res> get objectId;$ToolIdCopyWith<$Res> get toolId;

}
/// @nodoc
class _$ObjectReferenceLinkInfoCopyWithImpl<$Res>
    implements $ObjectReferenceLinkInfoCopyWith<$Res> {
  _$ObjectReferenceLinkInfoCopyWithImpl(this._self, this._then);

  final ObjectReferenceLinkInfo _self;
  final $Res Function(ObjectReferenceLinkInfo) _then;

/// Create a copy of ReferenceLinkInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? link = null,Object? objectId = null,Object? toolId = null,}) {
  return _then(ObjectReferenceLinkInfo(
null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as ReferenceLink,objectId: null == objectId ? _self.objectId : objectId // ignore: cast_nullable_to_non_nullable
as ObjectId,toolId: null == toolId ? _self.toolId : toolId // ignore: cast_nullable_to_non_nullable
as ToolId,
  ));
}

/// Create a copy of ReferenceLinkInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReferenceLinkCopyWith<$Res> get link {
  
  return $ReferenceLinkCopyWith<$Res>(_self.link, (value) {
    return _then(_self.copyWith(link: value));
  });
}/// Create a copy of ReferenceLinkInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ObjectIdCopyWith<$Res> get objectId {
  
  return $ObjectIdCopyWith<$Res>(_self.objectId, (value) {
    return _then(_self.copyWith(objectId: value));
  });
}/// Create a copy of ReferenceLinkInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ToolIdCopyWith<$Res> get toolId {
  
  return $ToolIdCopyWith<$Res>(_self.toolId, (value) {
    return _then(_self.copyWith(toolId: value));
  });
}
}

// dart format on

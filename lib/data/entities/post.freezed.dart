// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPost {

 int get id; String get title; String get body; List<String> get tags; PostReactions get reactions; int get views; int get userId;
/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPostCopyWith<UserPost> get copyWith => _$UserPostCopyWithImpl<UserPost>(this as UserPost, _$identity);

  /// Serializes this UserPost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPost&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.reactions, reactions) || other.reactions == reactions)&&(identical(other.views, views) || other.views == views)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,const DeepCollectionEquality().hash(tags),reactions,views,userId);

@override
String toString() {
  return 'UserPost(id: $id, title: $title, body: $body, tags: $tags, reactions: $reactions, views: $views, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $UserPostCopyWith<$Res>  {
  factory $UserPostCopyWith(UserPost value, $Res Function(UserPost) _then) = _$UserPostCopyWithImpl;
@useResult
$Res call({
 int id, String title, String body, List<String> tags, PostReactions reactions, int views, int userId
});


$PostReactionsCopyWith<$Res> get reactions;

}
/// @nodoc
class _$UserPostCopyWithImpl<$Res>
    implements $UserPostCopyWith<$Res> {
  _$UserPostCopyWithImpl(this._self, this._then);

  final UserPost _self;
  final $Res Function(UserPost) _then;

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,Object? tags = null,Object? reactions = null,Object? views = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,reactions: null == reactions ? _self.reactions : reactions // ignore: cast_nullable_to_non_nullable
as PostReactions,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostReactionsCopyWith<$Res> get reactions {
  
  return $PostReactionsCopyWith<$Res>(_self.reactions, (value) {
    return _then(_self.copyWith(reactions: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserPost implements UserPost {
  const _UserPost({required this.id, required this.title, required this.body, required final  List<String> tags, required this.reactions, required this.views, required this.userId}): _tags = tags;
  factory _UserPost.fromJson(Map<String, dynamic> json) => _$UserPostFromJson(json);

@override final  int id;
@override final  String title;
@override final  String body;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  PostReactions reactions;
@override final  int views;
@override final  int userId;

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPostCopyWith<_UserPost> get copyWith => __$UserPostCopyWithImpl<_UserPost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPost&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.reactions, reactions) || other.reactions == reactions)&&(identical(other.views, views) || other.views == views)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,const DeepCollectionEquality().hash(_tags),reactions,views,userId);

@override
String toString() {
  return 'UserPost(id: $id, title: $title, body: $body, tags: $tags, reactions: $reactions, views: $views, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$UserPostCopyWith<$Res> implements $UserPostCopyWith<$Res> {
  factory _$UserPostCopyWith(_UserPost value, $Res Function(_UserPost) _then) = __$UserPostCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String body, List<String> tags, PostReactions reactions, int views, int userId
});


@override $PostReactionsCopyWith<$Res> get reactions;

}
/// @nodoc
class __$UserPostCopyWithImpl<$Res>
    implements _$UserPostCopyWith<$Res> {
  __$UserPostCopyWithImpl(this._self, this._then);

  final _UserPost _self;
  final $Res Function(_UserPost) _then;

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? tags = null,Object? reactions = null,Object? views = null,Object? userId = null,}) {
  return _then(_UserPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,reactions: null == reactions ? _self.reactions : reactions // ignore: cast_nullable_to_non_nullable
as PostReactions,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostReactionsCopyWith<$Res> get reactions {
  
  return $PostReactionsCopyWith<$Res>(_self.reactions, (value) {
    return _then(_self.copyWith(reactions: value));
  });
}
}


/// @nodoc
mixin _$PostReactions {

 int get likes; int get dislikes;
/// Create a copy of PostReactions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostReactionsCopyWith<PostReactions> get copyWith => _$PostReactionsCopyWithImpl<PostReactions>(this as PostReactions, _$identity);

  /// Serializes this PostReactions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostReactions&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.dislikes, dislikes) || other.dislikes == dislikes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,likes,dislikes);

@override
String toString() {
  return 'PostReactions(likes: $likes, dislikes: $dislikes)';
}


}

/// @nodoc
abstract mixin class $PostReactionsCopyWith<$Res>  {
  factory $PostReactionsCopyWith(PostReactions value, $Res Function(PostReactions) _then) = _$PostReactionsCopyWithImpl;
@useResult
$Res call({
 int likes, int dislikes
});




}
/// @nodoc
class _$PostReactionsCopyWithImpl<$Res>
    implements $PostReactionsCopyWith<$Res> {
  _$PostReactionsCopyWithImpl(this._self, this._then);

  final PostReactions _self;
  final $Res Function(PostReactions) _then;

/// Create a copy of PostReactions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? likes = null,Object? dislikes = null,}) {
  return _then(_self.copyWith(
likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,dislikes: null == dislikes ? _self.dislikes : dislikes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PostReactions implements PostReactions {
  const _PostReactions({required this.likes, required this.dislikes});
  factory _PostReactions.fromJson(Map<String, dynamic> json) => _$PostReactionsFromJson(json);

@override final  int likes;
@override final  int dislikes;

/// Create a copy of PostReactions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostReactionsCopyWith<_PostReactions> get copyWith => __$PostReactionsCopyWithImpl<_PostReactions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostReactionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostReactions&&(identical(other.likes, likes) || other.likes == likes)&&(identical(other.dislikes, dislikes) || other.dislikes == dislikes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,likes,dislikes);

@override
String toString() {
  return 'PostReactions(likes: $likes, dislikes: $dislikes)';
}


}

/// @nodoc
abstract mixin class _$PostReactionsCopyWith<$Res> implements $PostReactionsCopyWith<$Res> {
  factory _$PostReactionsCopyWith(_PostReactions value, $Res Function(_PostReactions) _then) = __$PostReactionsCopyWithImpl;
@override @useResult
$Res call({
 int likes, int dislikes
});




}
/// @nodoc
class __$PostReactionsCopyWithImpl<$Res>
    implements _$PostReactionsCopyWith<$Res> {
  __$PostReactionsCopyWithImpl(this._self, this._then);

  final _PostReactions _self;
  final $Res Function(_PostReactions) _then;

/// Create a copy of PostReactions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? likes = null,Object? dislikes = null,}) {
  return _then(_PostReactions(
likes: null == likes ? _self.likes : likes // ignore: cast_nullable_to_non_nullable
as int,dislikes: null == dislikes ? _self.dislikes : dislikes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

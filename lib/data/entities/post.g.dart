// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPost _$UserPostFromJson(Map<String, dynamic> json) => _UserPost(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  body: json['body'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  reactions: PostReactions.fromJson(json['reactions'] as Map<String, dynamic>),
  views: (json['views'] as num).toInt(),
  userId: (json['userId'] as num).toInt(),
);

Map<String, dynamic> _$UserPostToJson(_UserPost instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'body': instance.body,
  'tags': instance.tags,
  'reactions': instance.reactions,
  'views': instance.views,
  'userId': instance.userId,
};

_PostReactions _$PostReactionsFromJson(Map<String, dynamic> json) =>
    _PostReactions(
      likes: (json['likes'] as num).toInt(),
      dislikes: (json['dislikes'] as num).toInt(),
    );

Map<String, dynamic> _$PostReactionsToJson(_PostReactions instance) =>
    <String, dynamic>{'likes': instance.likes, 'dislikes': instance.dislikes};

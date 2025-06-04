// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPostsResponse _$UserPostsResponseFromJson(Map<String, dynamic> json) =>
    UserPostsResponse(
      (json['posts'] as List<dynamic>)
          .map((e) => UserPost.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['total'] as num).toInt(),
      (json['skip'] as num).toInt(),
      (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$UserPostsResponseToJson(UserPostsResponse instance) =>
    <String, dynamic>{
      'posts': instance.posts,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };

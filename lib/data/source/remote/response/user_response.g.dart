// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  (json['users'] as List<dynamic>)
      .map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
  (json['total'] as num).toInt(),
  (json['skip'] as num).toInt(),
  (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'users': instance.users,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };

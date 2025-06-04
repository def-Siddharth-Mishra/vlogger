// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  email: json['email'] as String,
  birthDate: const DateTimeConverter().fromJson(json['birthDate'] as String),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  age: (json['age'] as num).toInt(),
  image: Uri.parse(json['image'] as String),
  role: $enumDecode(_$RoleEnumMap, json['role']),
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'birthDate': const DateTimeConverter().toJson(instance.birthDate),
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
      'image': instance.image.toString(),
      'role': _$RoleEnumMap[instance.role]!,
    };

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.user: 'user',
  Role.moderator: 'moderator',
};

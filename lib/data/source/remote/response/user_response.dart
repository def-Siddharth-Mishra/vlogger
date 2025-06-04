import 'package:json_annotation/json_annotation.dart';
import 'package:vlogger/data/entities/user.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final List<UserEntity> users;
  final int total;
  final int skip;
  final int limit;
  UserResponse(this.users, this.total, this.skip, this.limit);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

UserResponse deserializeUserResponse(Map<String, dynamic> json) =>
    UserResponse.fromJson(json);

Map<String, dynamic> serializeUserResponse(UserResponse object) =>
    object.toJson();

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vlogger/core/date_time.dart';

import 'enums.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String username,
    required String email,
    @DateTimeConverter() required DateTime birthDate,
    required String firstName,
    required String lastName,
    required int age,
    required Uri image,
    required Role role,
  }) = _UserEntity;

  const UserEntity._();

  factory UserEntity.fromJson(Map<String, Object?> json) =>
      _$UserEntityFromJson(json);
}

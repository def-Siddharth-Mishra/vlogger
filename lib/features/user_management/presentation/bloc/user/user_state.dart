import 'package:equatable/equatable.dart';

import '../../../../../data/entities/user.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserEntity> users;
  final bool hasReachedMax;
  const UserLoaded(this.users, {this.hasReachedMax = false});
  @override
  List<Object?> get props => [users, hasReachedMax];
}

class UserError extends UserState {
  final String message;
  const UserError(this.message);
  @override
  List<Object?> get props => [message];
}

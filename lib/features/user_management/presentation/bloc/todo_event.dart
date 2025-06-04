import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object?> get props => [];
}

class FetchTodosByUser extends TodoEvent {
  final int userId;
  const FetchTodosByUser(this.userId);

  @override
  List<Object?> get props => [userId];
}

import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class FetchUsers extends UserEvent {
  final int limit;
  final int skip;
  const FetchUsers({this.limit = 20, this.skip = 0});
}

class FetchMoreUsers extends UserEvent {}

class SearchUsers extends UserEvent {
  final String query;
  const SearchUsers(this.query);

  @override
  List<Object?> get props => [query];
}

import 'package:equatable/equatable.dart';

import '../../../../../data/entities/post.dart';

abstract class PostState extends Equatable {
  const PostState();
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<UserPost> posts;
  const PostLoaded(this.posts);
}

class PostError extends PostState {
  final String message;
  const PostError(this.message);
}

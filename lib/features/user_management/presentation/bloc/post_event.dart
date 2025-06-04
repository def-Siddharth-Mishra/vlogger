import 'package:equatable/equatable.dart';

import '../../../../data/entities/post.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
  @override
  List<Object?> get props => [];
}

class FetchPostsByUser extends PostEvent {
  final int userId;
  const FetchPostsByUser(this.userId);
}

class AddLocalPost extends PostEvent {
  final UserPost newPost;
  const AddLocalPost(this.newPost);
}

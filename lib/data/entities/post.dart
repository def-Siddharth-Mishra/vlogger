import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class UserPost with _$UserPost {
  const factory UserPost({
    required int id,
    required String title,
    required String body,
    required List<String> tags,
    required PostReactions reactions,
    required int views,
    required int userId,
  }) = _UserPost;

  factory UserPost.fromJson(Map<String, dynamic> json) =>
      _$UserPostFromJson(json);
}

@freezed
abstract class PostReactions with _$PostReactions {
  const factory PostReactions({required int likes, required int dislikes}) =
      _PostReactions;

  factory PostReactions.fromJson(Map<String, dynamic> json) =>
      _$PostReactionsFromJson(json);
}

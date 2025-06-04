import 'package:json_annotation/json_annotation.dart';
import 'package:vlogger/data/entities/post.dart';

part 'posts_response.g.dart';

@JsonSerializable()
class UserPostsResponse {
  final List<UserPost> posts;
  final int total;
  final int skip;
  final int limit;
  UserPostsResponse(this.posts, this.total, this.skip, this.limit);

  factory UserPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserPostsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserPostsResponseToJson(this);
}

UserPostsResponse deserializeUserPostsResponse(Map<String, dynamic> json) =>
    UserPostsResponse.fromJson(json);

Map<String, dynamic> serializeUserPostsResponse(UserPostsResponse object) =>
    object.toJson();

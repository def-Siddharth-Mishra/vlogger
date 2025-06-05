import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/entities/post.dart';
import '../../../../../data/source/remote/api_client.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiClient apiClient;

  PostBloc(this.apiClient) : super(PostInitial()) {
    on<FetchPostsByUser>(_onFetchPostsByUser);
    on<AddLocalPost>(_onAddLocalPost);
  }

  Future<void> _onFetchPostsByUser(
    FetchPostsByUser event,
    Emitter<PostState> emit,
  ) async {
    emit(PostLoading());
    try {
      final response = await apiClient.getPostByUserId(userId: event.userId);
      emit(PostLoaded(response.posts));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  void _onAddLocalPost(AddLocalPost event, Emitter<PostState> emit) {
    if (state is PostLoaded) {
      final posts = List<UserPost>.from((state as PostLoaded).posts);
      posts.insert(0, event.newPost);
      emit(PostLoaded(posts));
    }
  }
}

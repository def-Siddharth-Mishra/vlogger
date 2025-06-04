import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/entities/user.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import 'create_post_screen.dart';

class UserDetailScreen extends StatelessWidget {
  final UserEntity user;
  const UserDetailScreen({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create:
              (_) => PostBloc(context.read())..add(FetchPostsByUser(user.id)),
        ),
        BlocProvider<TodoBloc>(
          create:
              (_) => TodoBloc(context.read())..add(FetchTodosByUser(user.id)),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('${user.firstName} ${user.lastName}')),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final newPost = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CreatePostScreen(userId: user.id),
              ),
            );
            if (newPost != null) {
              context.read<PostBloc>().add(AddLocalPost(newPost));
            }
          },
          child: Icon(Icons.add),
          tooltip: 'Create Post',
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(user.image.toString()),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user.firstName} ${user.lastName}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(user.email),
                        Text('Role: ${user.role.name}'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Posts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  if (state is PostLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is PostLoaded) {
                    if (state.posts.isEmpty) return Text('No posts found');
                    return Column(
                      children:
                          state.posts
                              .map(
                                (post) => ListTile(
                                  title: Text(post.title),
                                  subtitle: Text(post.body),
                                  trailing: Text(
                                    '👍 ${post.reactions.likes} 👎 ${post.reactions.dislikes}',
                                  ),
                                ),
                              )
                              .toList(),
                    );
                  } else if (state is PostError) {
                    return Text('Error: ${state.message}');
                  }
                  return SizedBox();
                },
              ),
              SizedBox(height: 24),
              Text(
                'Todos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  if (state is TodoLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is TodoLoaded) {
                    if (state.todos.isEmpty) return Text('No todos found');
                    return Column(
                      children:
                          state.todos
                              .map(
                                (todo) => ListTile(
                                  title: Text(todo.todo),
                                  trailing: Icon(
                                    todo.completed
                                        ? Icons.check_circle
                                        : Icons.circle_outlined,
                                    color:
                                        todo.completed
                                            ? Colors.green
                                            : Colors.grey,
                                  ),
                                ),
                              )
                              .toList(),
                    );
                  } else if (state is TodoError) {
                    return Text('Error: ${state.message}');
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

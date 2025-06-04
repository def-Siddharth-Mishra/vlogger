import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/source/remote/api_client.dart';
import 'features/user_management/presentation/bloc/post_bloc.dart';
import 'features/user_management/presentation/bloc/todo_bloc.dart';
import 'features/user_management/presentation/bloc/user_bloc.dart';
import 'features/user_management/presentation/screens/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final apiClient = ApiClient(dio);

    return MultiRepositoryProvider(
      providers: [RepositoryProvider<ApiClient>.value(value: apiClient)],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(create: (context) => UserBloc(apiClient)),
          BlocProvider<PostBloc>(create: (context) => PostBloc(apiClient)),
          BlocProvider<TodoBloc>(create: (context) => TodoBloc(apiClient)),
        ],
        child: MaterialApp(
          title: 'Flutter Assessment',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(brightness: Brightness.dark),
          themeMode: ThemeMode.system,
          home: const UserListScreen(),
        ),
      ),
    );
  }
}

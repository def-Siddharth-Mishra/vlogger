import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vlogger/features/user_management/presentation/bloc/todo/todo_event.dart';
import 'package:vlogger/features/user_management/presentation/bloc/todo/todo_state.dart';

import '../../../../../data/source/remote/api_client.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final ApiClient apiClient;

  TodoBloc(this.apiClient) : super(TodoInitial()) {
    on<FetchTodosByUser>(_onFetchTodosByUser);
  }

  Future<void> _onFetchTodosByUser(
    FetchTodosByUser event,
    Emitter<TodoState> emit,
  ) async {
    emit(TodoLoading());
    try {
      final response = await apiClient.getTodos(userId: event.userId);
      emit(TodoLoaded(response.todos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}

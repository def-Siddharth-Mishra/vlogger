import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vlogger/features/user_management/presentation/bloc/user/user_event.dart';
import 'package:vlogger/features/user_management/presentation/bloc/user/user_state.dart'
    show UserState, UserInitial, UserLoading, UserLoaded, UserError;

import '../../../../../data/entities/user.dart';
import '../../../../../data/source/remote/api_client.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiClient apiClient;
  static const int _pageSize = 20;
  int _skip = 0;
  bool _isFetching = false;
  List<UserEntity> _allUsers = [];

  UserBloc(this.apiClient) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
    on<FetchMoreUsers>(_onFetchMoreUsers);
    on<SearchUsers>(_onSearchUsers);
  }

  Future<void> _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final response = await apiClient.getUsers(limit: _pageSize, skip: 0);
      _allUsers = response.users;
      _skip = _pageSize;
      emit(
        UserLoaded(_allUsers, hasReachedMax: response.users.length < _pageSize),
      );
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onFetchMoreUsers(
    FetchMoreUsers event,
    Emitter<UserState> emit,
  ) async {
    if (_isFetching ||
        state is UserLoading ||
        (state is UserLoaded && (state as UserLoaded).hasReachedMax))
      return;
    _isFetching = true;
    try {
      final response = await apiClient.getUsers(limit: _pageSize, skip: _skip);
      if (response.users.isEmpty) {
        emit(UserLoaded(_allUsers, hasReachedMax: true));
      } else {
        _allUsers.addAll(response.users);
        _skip += _pageSize;
        emit(
          UserLoaded(
            _allUsers,
            hasReachedMax: response.users.length < _pageSize,
          ),
        );
      }
    } catch (e) {
      emit(UserError(e.toString()));
    } finally {
      _isFetching = false;
    }
  }

  Future<void> _onSearchUsers(
    SearchUsers event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final response = await apiClient.getUsers(limit: 100, skip: 0);
      final filtered =
          response.users
              .where(
                (u) =>
                    u.username.toLowerCase().contains(
                      event.query.toLowerCase(),
                    ) ||
                    u.firstName.toLowerCase().contains(
                      event.query.toLowerCase(),
                    ) ||
                    u.lastName.toLowerCase().contains(
                      event.query.toLowerCase(),
                    ),
              )
              .toList();
      emit(UserLoaded(filtered, hasReachedMax: true));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}

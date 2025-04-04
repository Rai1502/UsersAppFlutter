import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_app_flutter/domain/models/user.dart';
import 'package:users_app_flutter/domain/repositories/users_repository.dart';

part 'users_state.dart';
part 'users_cubit.freezed.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.usersRepository) : super(UsersState()) {
    getUsers();
  }

  final UsersRepository usersRepository;

  void getUsers() {
    emit(state.copyWith(isLoading: true));
    usersRepository.getUsers().listen((users) {
      emit(state.copyWith(users: users, isLoading: false));
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false));
    });
  }
}

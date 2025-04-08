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

  void setName(String name) {
    emit(state.copyWith(name: name));
  }

  void setUserName(String userName) {
    emit(state.copyWith(userName: userName));
  }

  void setPhone(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void setWeb(String web) {
    emit(state.copyWith(web: web));
  }

  void getUsers() {
    emit(state.copyWith(isLoading: true));
    usersRepository.getUsers().listen((users) {
      emit(state.copyWith(users: users, isLoading: false));
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false));
    });
  }

  void createUser({Function? onSuccess}) {
    emit(state.copyWith(isLoading: true));
    usersRepository
        .createUser(Users(
            id: 0,
            name: state.name,
            userName: state.userName,
            email: state.email,
            phone: state.phone,
            webSite: state.web))
        .listen((Users user) {
      final listaActual = state.users;
      final listaNueva = [...listaActual, user];
      emit(state.copyWith(users: listaNueva, isLoading: false));
      onSuccess?.call();
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false));
      print('No se creo el usuario');
    });
  }

  void updateUser({Function? onSuccess, int? id}) {
    emit(state.copyWith(isLoading: true));
    usersRepository
        .updateUser(Users(
            id: id ?? 0,
            name: state.name,
            userName: state.userName,
            email: state.email,
            phone: state.phone,
            webSite: state.web))
        .listen((user) {
      final listaActual =
          List<Users>.from(state.users); // Crear una copia de la lista
      final index = listaActual.indexWhere((u) => u.id == user.id);
      if (index != -1) {
        listaActual[index] = user;
        emit(state.copyWith(users: listaActual, isLoading: false));
        onSuccess?.call();
      }
    }, onError: (Object error) {
      emit(state.copyWith(isLoading: false));
      print('No se actualizo el usuario');
    });
  }
}

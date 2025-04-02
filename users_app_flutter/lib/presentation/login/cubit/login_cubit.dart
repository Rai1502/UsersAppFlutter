import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_app_flutter/domain/repositories/login_repository.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepository) : super(LoginState());

  final LoginRepository loginRepository;

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  bool canLogin() {
    return state.email.isNotEmpty && state.password.isNotEmpty;
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }

  void login({Function? onSuccess, Function? onError}) {
    emit(state.copyWith(isLoading: true));
    loginRepository.loginFirebase(state.email, state.password).listen(
        (bool authenticated) {
      if (authenticated) {
        onSuccess?.call();
        emit(state.copyWith(isLoading: false));
      } else {
        print('Error al iniciar sesion');
        emit(state.copyWith(isLoading: false));
      }
    }, onError: (Object error) {
      onError?.call();
      emit(state.copyWith(isLoading: false));
    });
  }
}

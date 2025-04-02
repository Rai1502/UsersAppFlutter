import 'package:users_app_flutter/data/sources/login_source.dart';
import 'package:users_app_flutter/domain/repositories/login_repository.dart';

class LoginDataRepository implements LoginRepository {
  LoginDataRepository({this.loginSource});

  final LoginSource? loginSource;

  @override
  Stream<bool> loginFirebase(String email, String password) async* {
    yield* loginSource!.loginFirebase(email, password);
  }
}

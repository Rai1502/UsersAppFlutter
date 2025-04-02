import 'package:users_app_flutter/data/sources/login_source.dart';
import 'package:users_app_flutter/services/firebase_service.dart';

class LoginRemoteSource implements LoginSource {
  @override
  Stream<bool> loginFirebase(String email, String password) async* {
    yield* FirebaseAuthentication().login(email, password);
  }
}

import 'package:users_app_flutter/domain/models/user.dart';

abstract class UsersRepository {
  Stream<List<Users>> getUsers();
}

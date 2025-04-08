import 'package:users_app_flutter/domain/models/user.dart';

abstract class UsersRepository {
  Stream<List<Users>> getUsers();
  Stream<Users> createUser(Users user);
  Stream<Users> updateUser(Users user);
  Stream<bool> deleteUser(String id);
}

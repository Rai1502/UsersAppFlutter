import 'package:users_app_flutter/data/models/users_dto.dart';
import 'package:users_app_flutter/domain/models/user.dart';

abstract class UsersSource {
  Stream<List<UsersDto>> getUsers();
  Stream<UsersDto> createUSer(Users user);
  Stream<UsersDto> updateUser(Users user);
}

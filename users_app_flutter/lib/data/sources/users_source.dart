import 'package:users_app_flutter/data/models/users_dto.dart';

abstract class UsersSource {
  Stream<List<UsersDto>> getUsers();
}

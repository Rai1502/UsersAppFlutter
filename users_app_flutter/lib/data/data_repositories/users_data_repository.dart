import 'package:users_app_flutter/data/models/users_dto.dart';
import 'package:users_app_flutter/data/sources/users_source.dart';
import 'package:users_app_flutter/domain/repositories/users_repository.dart';
import 'package:users_app_flutter/domain/models/user.dart';

class UsersDataRepository implements UsersRepository {
  UsersDataRepository({this.usersSource});

  final UsersSource? usersSource;

  @override
  Stream<List<Users>> getUsers() async* {
    yield* usersSource!
        .getUsers()
        .map((List<UsersDto> list) => list.map(_mapUsersFromDto).toList());
  }

  Users _mapUsersFromDto(UsersDto user) => Users(
        id: user.id ?? 0,
        name: user.name ?? '',
        userName: user.username ?? '',
        email: user.email ?? '',
        phone: user.phone ?? '',
        webSite: user.website ?? '',
      );
}

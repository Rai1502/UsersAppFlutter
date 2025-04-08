import 'package:users_app_flutter/data/models/users_dto.dart';
import 'package:users_app_flutter/data/sources/users_source.dart';
import 'package:users_app_flutter/domain/models/user.dart';
import 'package:users_app_flutter/remote/constants/remote_constants.dart';
import 'package:users_app_flutter/remote/helper/api_service.dart';

class UsersRemoteSource implements UsersSource {
  @override
  Stream<List<UsersDto>> getUsers() async* {
    yield* ApiService()
        .get(RemoteConstants.getUsersMethod, queryParams: {})
        .asStream()
        .map((response) =>
            response.map((json) => UsersDto.fromJson(json)).toList());
  }

  @override
  Stream<UsersDto> createUSer(Users user) async* {
    yield* ApiService()
        .post(
            RemoteConstants.createUserMethod,
            CreateUserRequestDto(
                    name: user.name,
                    username: user.userName,
                    email: user.email,
                    phone: user.phone,
                    website: user.webSite)
                .toJson())
        .asStream()
        .map(
          (response) => UsersDto.fromJson(response),
        );
  }
}

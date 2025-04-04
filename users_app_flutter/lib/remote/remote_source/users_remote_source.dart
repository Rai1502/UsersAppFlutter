import 'package:users_app_flutter/data/models/users_dto.dart';
import 'package:users_app_flutter/data/sources/users_source.dart';
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
}


// .map((response) {
//           if (response is List) {
//             return response
//                 .map((user) => UsersDto.fromJson(user as Map<String, dynamic>))
//                 .toList();
//           } else {
//             throw AppError('La API devolvió un formato inesperado');
//           }
//         });
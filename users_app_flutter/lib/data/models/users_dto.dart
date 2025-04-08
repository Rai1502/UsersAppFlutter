import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_dto.g.dart';

@JsonSerializable()
class CreateUserRequestDto {
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  CreateUserRequestDto(
      {required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.website});

  factory CreateUserRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateUserRequestDtoToJson(this);
}

@JsonSerializable()
class UsersDto {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? website;

  UsersDto({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
  });

  factory UsersDto.fromJson(Map<String, dynamic> json) =>
      _$UsersDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UsersDtoToJson(this);
}

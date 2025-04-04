import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_dto.g.dart';

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

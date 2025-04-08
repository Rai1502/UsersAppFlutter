// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserRequestDto _$CreateUserRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CreateUserRequestDto(
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      website: json['website'] as String,
    );

Map<String, dynamic> _$CreateUserRequestDtoToJson(
        CreateUserRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'website': instance.website,
    };

UsersDto _$UsersDtoFromJson(Map<String, dynamic> json) => UsersDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$UsersDtoToJson(UsersDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'website': instance.website,
    };

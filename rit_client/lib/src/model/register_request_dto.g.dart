// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestDTO _$RegisterRequestDTOFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RegisterRequestDTO',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['email', 'username', 'password'],
        );
        final val = RegisterRequestDTO(
          email: $checkedConvert('email', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          password: $checkedConvert('password', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$RegisterRequestDTOToJson(RegisterRequestDTO instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
    };

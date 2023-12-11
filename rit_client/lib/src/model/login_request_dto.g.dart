// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestDTO _$LoginRequestDTOFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LoginRequestDTO',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['email', 'password'],
        );
        final val = LoginRequestDTO(
          email: $checkedConvert('email', (v) => v as String),
          password: $checkedConvert('password', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$LoginRequestDTOToJson(LoginRequestDTO instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

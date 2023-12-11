// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_otp_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterOtpRequestDTO _$RegisterOtpRequestDTOFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'RegisterOtpRequestDTO',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['email', 'otp'],
        );
        final val = RegisterOtpRequestDTO(
          email: $checkedConvert('email', (v) => v as String),
          otp: $checkedConvert('otp', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$RegisterOtpRequestDTOToJson(
        RegisterOtpRequestDTO instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
    };

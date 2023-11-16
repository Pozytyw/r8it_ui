// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseDTO _$LoginResponseDTOFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LoginResponseDTO',
      json,
      ($checkedConvert) {
        final val = LoginResponseDTO(
          jwt: $checkedConvert('jwt', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$LoginResponseDTOToJson(LoginResponseDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('jwt', instance.jwt);
  return val;
}

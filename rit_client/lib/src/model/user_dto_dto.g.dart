// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDtoDTO _$UserDtoDTOFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserDtoDTO',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id', 'email', 'username'],
        );
        final val = UserDtoDTO(
          id: $checkedConvert('id', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$UserDtoDTOToJson(UserDtoDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExceptionResponseDTO _$ExceptionResponseDTOFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ExceptionResponseDTO',
      json,
      ($checkedConvert) {
        final val = ExceptionResponseDTO(
          code: $checkedConvert('code', (v) => v as String?),
          message: $checkedConvert('message', (v) => v as String?),
          fieldConstraintViolation: $checkedConvert(
              'fieldConstraintViolation',
              (v) => (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(k, e as String),
                  )),
          uuid: $checkedConvert('uuid', (v) => v as String?),
        );
        return val;
      },
    );

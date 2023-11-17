import 'package:json_annotation/json_annotation.dart';

part 'exception_response_dto.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: false,
  disallowUnrecognizedKeys: false,
  createFactory: true,
)
class ExceptionResponseDTO {
  final String? code;
  final String? message;
  final Map<String, String>? fieldConstraintViolation;
  final String? uuid;

  ExceptionResponseDTO({
    this.code,
    this.message,
    this.fieldConstraintViolation,
    this.uuid,
  });

  factory ExceptionResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ExceptionResponseDTOFromJson(json);
}

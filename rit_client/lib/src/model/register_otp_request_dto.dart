//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'register_otp_request_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RegisterOtpRequestDTO {
  /// Returns a new [RegisterOtpRequestDTO] instance.
  RegisterOtpRequestDTO({

    required  this.email,

    required  this.otp,
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false
  )


  final String email;



  @JsonKey(
    
    name: r'otp',
    required: true,
    includeIfNull: false
  )


  final String otp;



  @override
  bool operator ==(Object other) => identical(this, other) || other is RegisterOtpRequestDTO &&
     other.email == email &&
     other.otp == otp;

  @override
  int get hashCode =>
    email.hashCode +
    otp.hashCode;

  factory RegisterOtpRequestDTO.fromJson(Map<String, dynamic> json) => _$RegisterOtpRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterOtpRequestDTOToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


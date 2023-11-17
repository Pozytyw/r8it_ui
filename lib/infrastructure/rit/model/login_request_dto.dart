//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'login_request_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LoginRequestDTO {
  /// Returns a new [LoginRequestDTO] instance.
  LoginRequestDTO({

    required  this.email,

    required  this.password,
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false
  )


  final String email;



  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false
  )


  final String password;



  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginRequestDTO &&
     other.email == email &&
     other.password == password;

  @override
  int get hashCode =>
    email.hashCode +
    password.hashCode;

  factory LoginRequestDTO.fromJson(Map<String, dynamic> json) => _$LoginRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDTOToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LoginResponseDTO {
  /// Returns a new [LoginResponseDTO] instance.
  LoginResponseDTO({

    required  this.jwt,
  });

  @JsonKey(
    
    name: r'jwt',
    required: true,
    includeIfNull: false
  )


  final String jwt;



  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginResponseDTO &&
     other.jwt == jwt;

  @override
  int get hashCode =>
    jwt.hashCode;

  factory LoginResponseDTO.fromJson(Map<String, dynamic> json) => _$LoginResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDTOToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


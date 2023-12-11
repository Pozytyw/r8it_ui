//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'user_dto_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserDtoDTO {
  /// Returns a new [UserDtoDTO] instance.
  UserDtoDTO({

    required  this.id,

    required  this.email,

    required  this.username,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false
  )


  final String id;



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false
  )


  final String email;



  @JsonKey(
    
    name: r'username',
    required: true,
    includeIfNull: false
  )


  final String username;



  @override
  bool operator ==(Object other) => identical(this, other) || other is UserDtoDTO &&
     other.id == id &&
     other.email == email &&
     other.username == username;

  @override
  int get hashCode =>
    id.hashCode +
    email.hashCode +
    username.hashCode;

  factory UserDtoDTO.fromJson(Map<String, dynamic> json) => _$UserDtoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoDTOToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


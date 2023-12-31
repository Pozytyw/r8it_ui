import 'package:rit_client/src/model/login_request_dto.dart';
import 'package:rit_client/src/model/login_response_dto.dart';
import 'package:rit_client/src/model/register_otp_request_dto.dart';
import 'package:rit_client/src/model/register_request_dto.dart';
import 'package:rit_client/src/model/user_dto_dto.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

  ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType, {bool growable= true}) {
      switch (targetType) {
        case 'String':
          return '$value' as ReturnType;
        case 'int':
          return (value is int ? value : int.parse('$value')) as ReturnType;
        case 'bool':
          if (value is bool) {
            return value as ReturnType;
          }
          final valueString = '$value'.toLowerCase();
          return (valueString == 'true' || valueString == '1') as ReturnType;
        case 'double':
          return (value is double ? value : double.parse('$value')) as ReturnType;
        case 'LoginRequestDTO':
          return LoginRequestDTO.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'LoginResponseDTO':
          return LoginResponseDTO.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RegisterOtpRequestDTO':
          return RegisterOtpRequestDTO.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RegisterRequestDTO':
          return RegisterRequestDTO.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UserDtoDTO':
          return UserDtoDTO.fromJson(value as Map<String, dynamic>) as ReturnType;
        default:
          RegExpMatch? match;

          if (value is List && (match = _regList.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toList(growable: growable) as ReturnType;
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toSet() as ReturnType;
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return Map<dynamic, BaseType>.fromIterables(
              value.keys,
              value.values.map((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable)),
            ) as ReturnType;
          }
          break;
    } 
    throw Exception('Cannot deserialize');
  }
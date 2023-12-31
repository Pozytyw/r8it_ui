# rit_client (EXPERIMENTAL)
RIT user domain service

This Dart package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 1.0.0-SNAPSHOT
- Build package: org.openapitools.codegen.languages.DartDioClientCodegen

## Requirements

* Dart 2.15.0+ or Flutter 2.8.0+
* Dio 5.0.0+ (https://pub.dev/packages/dio)
* JSON Serializable 6.1.5+ (https://pub.dev/packages/json_serializable)

## Installation & Usage

### pub.dev
To use the package from [pub.dev](https://pub.dev), please include the following in pubspec.yaml
```yaml
dependencies:
  rit_client: 1.0.0
```

### Github
If this Dart package is published to Github, please include the following in pubspec.yaml
```yaml
dependencies:
  rit_client:
    git:
      url: https://github.com/GIT_USER_ID/GIT_REPO_ID.git
      #ref: main
```

### Local development
To use the package from your local drive, please include the following in pubspec.yaml
```yaml
dependencies:
  rit_client:
    path: /path/to/rit_client
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```dart
import 'package:rit_client/rit_repository.dart';


final api = RitClient().getAuthEndpointApi();
final LoginRequestDTO loginRequestDTO = ; // LoginRequestDTO | 

try {
    final response = await api.login(loginRequestDTO);
    print(response);
} catch on DioException (e) {
    print("Exception when calling AuthEndpointApi->login: $e\n");
}

```

## Documentation for API Endpoints

All URIs are relative to *http://localhost*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
[*AuthEndpointApi*](doc/AuthEndpointApi.md) | [**login**](doc/AuthEndpointApi.md#login) | **POST** /v1/rit/users/auth/login | 
[*AuthEndpointApi*](doc/AuthEndpointApi.md) | [**registerInit**](doc/AuthEndpointApi.md#registerinit) | **POST** /v1/rit/users/auth/register | 
[*AuthEndpointApi*](doc/AuthEndpointApi.md) | [**userRegisterConfirmOtp**](doc/AuthEndpointApi.md#userregisterconfirmotp) | **POST** /v1/rit/users/auth/register/otp | 
[*UserInfoEndpointApi*](doc/UserInfoEndpointApi.md) | [**userInfo1**](doc/UserInfoEndpointApi.md#userinfo1) | **GET** /v1/rit/users/ | 


## Documentation For Models

 - [LoginRequestDTO](doc/LoginRequestDTO.md)
 - [LoginResponseDTO](doc/LoginResponseDTO.md)
 - [RegisterOtpRequestDTO](doc/RegisterOtpRequestDTO.md)
 - [RegisterRequestDTO](doc/RegisterRequestDTO.md)
 - [UserDtoDTO](doc/UserDtoDTO.md)


## Documentation For Authorization


Authentication schemes defined for the API:
### bearer_auth

- **Type**: HTTP Bearer Token authentication (JWT)


## Author




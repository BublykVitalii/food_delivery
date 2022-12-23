// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDataDTO _$AuthDataDTOFromJson(Map<String, dynamic> json) => AuthDataDTO(
      token: json['jwt'] as String?,
      user: json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthDataDTOToJson(AuthDataDTO instance) =>
    <String, dynamic>{
      'jwt': instance.token,
      'user': instance.user,
    };

import 'package:food_delivery/screens/auth/api/dto/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_data_dto.g.dart';

@JsonSerializable()
class AuthDataDTO {
  @JsonKey(name: 'jwt')
  final String? token;
  final UserDTO? user;

  AuthDataDTO({
    this.token,
    this.user,
  });

  Map<String, dynamic> toJson() => _$AuthDataDTOToJson(this);

  factory AuthDataDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthDataDTOFromJson(json);

  @override
  String toString() => 'AuthDataDTO(token: $token, user: $user,)';
}

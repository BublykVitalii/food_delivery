import 'package:json_annotation/json_annotation.dart';

part 'auth_dto.g.dart';

@JsonSerializable()
class AuthDTO {
  final String? username;
  final String? email;
  final String? password;
  final String? identifier;

  AuthDTO({
    this.username,
    this.email,
    this.password,
    this.identifier,
  });

  Map<String, dynamic> toJson() => _$AuthDTOToJson(this);

  factory AuthDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthDTOFromJson(json);

  @override
  String toString() =>
      'AuthDTO(username: $username, email: $email, password: $password,identifier: $identifier, )';
}

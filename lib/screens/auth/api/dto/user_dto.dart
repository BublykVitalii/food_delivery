import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO {
  @JsonKey(name: 'username')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'id')
  final int id;

  UserDTO({
    required this.name,
    required this.email,
    required this.id,
  });

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  @override
  String toString() => 'UserDTO(name: $name, email: $email, id: $id,)';
}

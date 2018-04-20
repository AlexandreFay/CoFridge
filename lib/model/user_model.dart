import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UserModel extends Object with _$UserModelSerializerMixin {
  String id;
  String name;
  String email;
  String password;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

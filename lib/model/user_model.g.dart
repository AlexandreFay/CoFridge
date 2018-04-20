// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => new UserModel()
  ..id = json['id'] as String
  ..name = json['name'] as String
  ..email = json['email'] as String
  ..password = json['password'] as String;

abstract class _$UserModelSerializerMixin {
  String get id;
  String get name;
  String get email;
  String get password;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('id', id);
    writeNotNull('name', name);
    writeNotNull('email', email);
    writeNotNull('password', password);
    return val;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cofridge_model.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

CoFridgeModel _$CoFridgeModelFromJson(Map<String, dynamic> json) =>
    new CoFridgeModel()
      ..food = (json['food'] as List)
          ?.map((e) => e == null
              ? null
              : new FoodModel.fromJson(e as Map<String, dynamic>))
          ?.toList()
      ..user = json['user'] == null
          ? null
          : new UserModel.fromJson(json['user'] as Map<String, dynamic>);

abstract class _$CoFridgeModelSerializerMixin {
  List<FoodModel> get food;
  UserModel get user;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('food', food);
    writeNotNull('user', user);
    return val;
  }
}

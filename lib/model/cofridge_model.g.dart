// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cofridge_model.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

CoFridgeModel _$CoFridgeModelFromJson(Map<String, dynamic> json) => new CoFridgeModel()
  ..food = json['food'] == null ? BehaviorSubject<List<FoodModel>>() : _foodFromJson(json['food'] as List<FoodModel>)
  ..user = json['user'] == null ? null : new UserModel.fromJson(json['user'] as Map<String, dynamic>);

abstract class _$CoFridgeModelSerializerMixin {
  BehaviorSubject<List<FoodModel>> get food;
  UserModel get user;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('food', food == null ? null : _foodToJson(food));
    writeNotNull('user', user);
    return val;
  }
}

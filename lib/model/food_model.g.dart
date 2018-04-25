// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) => new FoodModel()
  ..myQuantity = json['myQuantity'] as int
  ..code = json['code'] as String
  ..product_name_en = json['product_name_en'] as String
  ..image_url = json['image_url'] as String
  ..nutriments = json['nutriments'] == null
      ? null
      : new NutrimentModel.fromJson(json['nutriments'] as Map<String, dynamic>);

abstract class _$FoodModelSerializerMixin {
  int get myQuantity;
  String get code;
  String get product_name_en;
  String get image_url;
  NutrimentModel get nutriments;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('myQuantity', myQuantity);
    writeNotNull('code', code);
    writeNotNull('product_name_en', product_name_en);
    writeNotNull('image_url', image_url);
    writeNotNull('nutriments', nutriments);
    return val;
  }
}

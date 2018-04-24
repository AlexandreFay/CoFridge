import 'package:json_annotation/json_annotation.dart';

part 'nutriment_model.g.dart';

@JsonSerializable(includeIfNull: false)
class NutrimentModel extends Object with _$NutrimentModelSerializerMixin {
  String saturated_fat_value;
  String fat_serving;
  String sugars_serving;
  String sugars_value;
  String sodium_100g;
  String fat;
  String salt_100g;
  String fiber;
  String salt;
  String carbohydrates_value;
  String fiber_value;
  String proteins_value;
  double sugars;
  String energy_serving;
  String fiber_100g;
  String nutrition_score_fr_100g;
  String energy_100g;
  String proteins_serving;
  String salt_unit;
  String energy;
  String proteins_unit;
  String sodium_value;
  String carbohydrates_serving;
  double carbohydrates_100g;
  String fiber_serving;
  String proteins;
  double sugars_100g;
  String nutrition_score_uk;
  String sodium_unit;
  String fiber_unit;
  String energy_unit;
  String sugars_unit;
  String fat_100g;
  String sodium;
  String nutrition_score_uk_100g;
  String fat_unit;
  String saturated_fat;
  String salt_value;
  String energy_value;
  String saturated_fat_serving;
  String saturated_fat_100g;
  String carbohydrates_unit;
  String salt_serving;
  String saturated_fat_unit;
  String nutrition_score_fr;
  String proteins_100g;
  String sodium_serving;
  String fat_value;
  double carbohydrates;

  NutrimentModel();

  factory NutrimentModel.fromJson(Map<String, dynamic> json) => _$NutrimentModelFromJson(json);
}
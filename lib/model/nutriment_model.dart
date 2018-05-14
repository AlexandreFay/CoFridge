import 'package:json_annotation/json_annotation.dart';

part 'nutriment_model.g.dart';

@JsonSerializable(includeIfNull: false)
class NutrimentModel extends Object with _$NutrimentModelSerializerMixin {
  String energy_value;
  String energy_unit;

  String fat_value;
  String fat_unit;

  String carbohydrates_value;
  String carbohydrates_unit;

  String fiber_value;
  String fiber_unit;

  String proteins_value;
  String proteins_unit;

  String salt_value;
  String salt_unit;

  String sodium_value;
  String sodium_unit;

  String sugars_unit;
  String sugars_value;

  @JsonKey(name: "saturated-fat_value", nullable: true, includeIfNull: false)
  String saturatedFatValue;
  @JsonKey(name: "saturated-fat_unit", nullable: true, includeIfNull: false)
  String saturatedFatUnit;

  @JsonKey(name: "nutrition-score-fr", nullable: true, includeIfNull: false)
  String nutritionScoreFr;

  NutrimentModel();

  factory NutrimentModel.fromJson(Map<String, dynamic> json) => _$NutrimentModelFromJson(json);
}

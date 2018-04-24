// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutriment_model.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

NutrimentModel _$NutrimentModelFromJson(Map<String, dynamic> json) =>
    new NutrimentModel()
      ..saturated_fat_value = json['saturated_fat_value'] as String
      ..fat_serving = json['fat_serving'] as String
      ..sugars_serving = json['sugars_serving'] as String
      ..sugars_value = json['sugars_value'] as String
      ..sodium_100g = json['sodium_100g'] as String
      ..fat = json['fat'] as String
      ..salt_100g = json['salt_100g'] as String
      ..fiber = json['fiber'] as String
      ..salt = json['salt'] as String
      ..carbohydrates_value = json['carbohydrates_value'] as String
      ..fiber_value = json['fiber_value'] as String
      ..proteins_value = json['proteins_value'] as String
      ..sugars = (json['sugars'] as num)?.toDouble()
      ..energy_serving = json['energy_serving'] as String
      ..fiber_100g = json['fiber_100g'] as String
      ..nutrition_score_fr_100g = json['nutrition_score_fr_100g'] as String
      ..energy_100g = json['energy_100g'] as String
      ..proteins_serving = json['proteins_serving'] as String
      ..salt_unit = json['salt_unit'] as String
      ..energy = json['energy'] as String
      ..proteins_unit = json['proteins_unit'] as String
      ..sodium_value = json['sodium_value'] as String
      ..carbohydrates_serving = json['carbohydrates_serving'] as String
      ..carbohydrates_100g = (json['carbohydrates_100g'] as num)?.toDouble()
      ..fiber_serving = json['fiber_serving'] as String
      ..proteins = json['proteins'] as String
      ..sugars_100g = (json['sugars_100g'] as num)?.toDouble()
      ..nutrition_score_uk = json['nutrition_score_uk'] as String
      ..sodium_unit = json['sodium_unit'] as String
      ..fiber_unit = json['fiber_unit'] as String
      ..energy_unit = json['energy_unit'] as String
      ..sugars_unit = json['sugars_unit'] as String
      ..fat_100g = json['fat_100g'] as String
      ..sodium = json['sodium'] as String
      ..nutrition_score_uk_100g = json['nutrition_score_uk_100g'] as String
      ..fat_unit = json['fat_unit'] as String
      ..saturated_fat = json['saturated_fat'] as String
      ..salt_value = json['salt_value'] as String
      ..energy_value = json['energy_value'] as String
      ..saturated_fat_serving = json['saturated_fat_serving'] as String
      ..saturated_fat_100g = json['saturated_fat_100g'] as String
      ..carbohydrates_unit = json['carbohydrates_unit'] as String
      ..salt_serving = json['salt_serving'] as String
      ..saturated_fat_unit = json['saturated_fat_unit'] as String
      ..nutrition_score_fr = json['nutrition_score_fr'] as String
      ..proteins_100g = json['proteins_100g'] as String
      ..sodium_serving = json['sodium_serving'] as String
      ..fat_value = json['fat_value'] as String
      ..carbohydrates = (json['carbohydrates'] as num)?.toDouble();

abstract class _$NutrimentModelSerializerMixin {
  String get saturated_fat_value;
  String get fat_serving;
  String get sugars_serving;
  String get sugars_value;
  String get sodium_100g;
  String get fat;
  String get salt_100g;
  String get fiber;
  String get salt;
  String get carbohydrates_value;
  String get fiber_value;
  String get proteins_value;
  double get sugars;
  String get energy_serving;
  String get fiber_100g;
  String get nutrition_score_fr_100g;
  String get energy_100g;
  String get proteins_serving;
  String get salt_unit;
  String get energy;
  String get proteins_unit;
  String get sodium_value;
  String get carbohydrates_serving;
  double get carbohydrates_100g;
  String get fiber_serving;
  String get proteins;
  double get sugars_100g;
  String get nutrition_score_uk;
  String get sodium_unit;
  String get fiber_unit;
  String get energy_unit;
  String get sugars_unit;
  String get fat_100g;
  String get sodium;
  String get nutrition_score_uk_100g;
  String get fat_unit;
  String get saturated_fat;
  String get salt_value;
  String get energy_value;
  String get saturated_fat_serving;
  String get saturated_fat_100g;
  String get carbohydrates_unit;
  String get salt_serving;
  String get saturated_fat_unit;
  String get nutrition_score_fr;
  String get proteins_100g;
  String get sodium_serving;
  String get fat_value;
  double get carbohydrates;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('saturated_fat_value', saturated_fat_value);
    writeNotNull('fat_serving', fat_serving);
    writeNotNull('sugars_serving', sugars_serving);
    writeNotNull('sugars_value', sugars_value);
    writeNotNull('sodium_100g', sodium_100g);
    writeNotNull('fat', fat);
    writeNotNull('salt_100g', salt_100g);
    writeNotNull('fiber', fiber);
    writeNotNull('salt', salt);
    writeNotNull('carbohydrates_value', carbohydrates_value);
    writeNotNull('fiber_value', fiber_value);
    writeNotNull('proteins_value', proteins_value);
    writeNotNull('sugars', sugars);
    writeNotNull('energy_serving', energy_serving);
    writeNotNull('fiber_100g', fiber_100g);
    writeNotNull('nutrition_score_fr_100g', nutrition_score_fr_100g);
    writeNotNull('energy_100g', energy_100g);
    writeNotNull('proteins_serving', proteins_serving);
    writeNotNull('salt_unit', salt_unit);
    writeNotNull('energy', energy);
    writeNotNull('proteins_unit', proteins_unit);
    writeNotNull('sodium_value', sodium_value);
    writeNotNull('carbohydrates_serving', carbohydrates_serving);
    writeNotNull('carbohydrates_100g', carbohydrates_100g);
    writeNotNull('fiber_serving', fiber_serving);
    writeNotNull('proteins', proteins);
    writeNotNull('sugars_100g', sugars_100g);
    writeNotNull('nutrition_score_uk', nutrition_score_uk);
    writeNotNull('sodium_unit', sodium_unit);
    writeNotNull('fiber_unit', fiber_unit);
    writeNotNull('energy_unit', energy_unit);
    writeNotNull('sugars_unit', sugars_unit);
    writeNotNull('fat_100g', fat_100g);
    writeNotNull('sodium', sodium);
    writeNotNull('nutrition_score_uk_100g', nutrition_score_uk_100g);
    writeNotNull('fat_unit', fat_unit);
    writeNotNull('saturated_fat', saturated_fat);
    writeNotNull('salt_value', salt_value);
    writeNotNull('energy_value', energy_value);
    writeNotNull('saturated_fat_serving', saturated_fat_serving);
    writeNotNull('saturated_fat_100g', saturated_fat_100g);
    writeNotNull('carbohydrates_unit', carbohydrates_unit);
    writeNotNull('salt_serving', salt_serving);
    writeNotNull('saturated_fat_unit', saturated_fat_unit);
    writeNotNull('nutrition_score_fr', nutrition_score_fr);
    writeNotNull('proteins_100g', proteins_100g);
    writeNotNull('sodium_serving', sodium_serving);
    writeNotNull('fat_value', fat_value);
    writeNotNull('carbohydrates', carbohydrates);
    return val;
  }
}

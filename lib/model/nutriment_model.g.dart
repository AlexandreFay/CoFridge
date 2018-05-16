// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutriment_model.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

NutrimentModel _$NutrimentModelFromJson(Map<String, dynamic> json) =>
    new NutrimentModel()
      ..energy_value = json['energy_value'] as String
      ..energy_unit = json['energy_unit'] as String
      ..fat_value = json['fat_value'] as String
      ..fat_unit = json['fat_unit'] as String
      ..carbohydrates_value = json['carbohydrates_value'] as String
      ..carbohydrates_unit = json['carbohydrates_unit'] as String
      ..fiber_value = json['fiber_value'] as String
      ..fiber_unit = json['fiber_unit'] as String
      ..proteins_value = json['proteins_value'] as String
      ..proteins_unit = json['proteins_unit'] as String
      ..salt_value = json['salt_value'] as String
      ..salt_unit = json['salt_unit'] as String
      ..sodium_value = json['sodium_value'] as String
      ..sodium_unit = json['sodium_unit'] as String
      ..sugars_unit = json['sugars_unit'] as String
      ..sugars_value = json['sugars_value'] as String
      ..saturatedFatValue = json['saturated-fat_value'] == null
          ? null
          : _toStringConverter(json['saturated-fat_value'])
      ..saturatedFatUnit = json['saturated-fat_unit'] == null
          ? null
          : _toStringConverter(json['saturated-fat_unit'])
      ..nutritionScoreFr = json['nutrition-score-fr'] == null
          ? null
          : _toStringConverter(json['nutrition-score-fr']);

abstract class _$NutrimentModelSerializerMixin {
  String get energy_value;
  String get energy_unit;
  String get fat_value;
  String get fat_unit;
  String get carbohydrates_value;
  String get carbohydrates_unit;
  String get fiber_value;
  String get fiber_unit;
  String get proteins_value;
  String get proteins_unit;
  String get salt_value;
  String get salt_unit;
  String get sodium_value;
  String get sodium_unit;
  String get sugars_unit;
  String get sugars_value;
  String get saturatedFatValue;
  String get saturatedFatUnit;
  String get nutritionScoreFr;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('energy_value', energy_value);
    writeNotNull('energy_unit', energy_unit);
    writeNotNull('fat_value', fat_value);
    writeNotNull('fat_unit', fat_unit);
    writeNotNull('carbohydrates_value', carbohydrates_value);
    writeNotNull('carbohydrates_unit', carbohydrates_unit);
    writeNotNull('fiber_value', fiber_value);
    writeNotNull('fiber_unit', fiber_unit);
    writeNotNull('proteins_value', proteins_value);
    writeNotNull('proteins_unit', proteins_unit);
    writeNotNull('salt_value', salt_value);
    writeNotNull('salt_unit', salt_unit);
    writeNotNull('sodium_value', sodium_value);
    writeNotNull('sodium_unit', sodium_unit);
    writeNotNull('sugars_unit', sugars_unit);
    writeNotNull('sugars_value', sugars_value);
    writeNotNull('saturated-fat_value', saturatedFatValue);
    writeNotNull('saturated-fat_unit', saturatedFatUnit);
    writeNotNull('nutrition-score-fr', nutritionScoreFr);
    return val;
  }
}

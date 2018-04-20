// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) => new FoodModel()
  ..name = json['name'] as String
  ..type = json['type'] as String
  ..calories = (json['calories'] as num)?.toDouble()
  ..kilojoules = (json['kilojoules'] as num)?.toDouble()
  ..lipids = (json['lipids'] as num)?.toDouble()
  ..saturatedFats = (json['saturatedFats'] as num)?.toDouble()
  ..monoUnsaturatedFats = (json['monoUnsaturatedFats'] as num)?.toDouble()
  ..polyUnsaturatedFats = (json['polyUnsaturatedFats'] as num)?.toDouble()
  ..carbohydrates = (json['carbohydrates'] as num)?.toDouble()
  ..sugars = (json['sugars'] as num)?.toDouble()
  ..proteins = (json['proteins'] as num)?.toDouble()
  ..fibers = (json['fibers'] as num)?.toDouble()
  ..cholesterol = (json['cholesterol'] as num)?.toDouble()
  ..sodium = (json['sodium'] as num)?.toDouble()
  ..water = (json['water'] as num)?.toDouble();

abstract class _$FoodModelSerializerMixin {
  String get name;
  String get type;
  double get calories;
  double get kilojoules;
  double get lipids;
  double get saturatedFats;
  double get monoUnsaturatedFats;
  double get polyUnsaturatedFats;
  double get carbohydrates;
  double get sugars;
  double get proteins;
  double get fibers;
  double get cholesterol;
  double get sodium;
  double get water;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('name', name);
    writeNotNull('type', type);
    writeNotNull('calories', calories);
    writeNotNull('kilojoules', kilojoules);
    writeNotNull('lipids', lipids);
    writeNotNull('saturatedFats', saturatedFats);
    writeNotNull('monoUnsaturatedFats', monoUnsaturatedFats);
    writeNotNull('polyUnsaturatedFats', polyUnsaturatedFats);
    writeNotNull('carbohydrates', carbohydrates);
    writeNotNull('sugars', sugars);
    writeNotNull('proteins', proteins);
    writeNotNull('fibers', fibers);
    writeNotNull('cholesterol', cholesterol);
    writeNotNull('sodium', sodium);
    writeNotNull('water', water);
    return val;
  }
}

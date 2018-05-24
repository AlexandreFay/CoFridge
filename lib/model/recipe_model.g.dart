// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => new RecipeModel()
  ..title = json['title'] as String
  ..image = json['image'] as String
  ..time = json['time'] as String
  ..people = json['people'] as String
  ..level = json['level'] as String
  ..cost = json['cost'] as String
  ..preparation = json['preparation'] as String
  ..cooking = json['cooking'] as String
  ..steps = (json['steps'] as List)?.map((e) => e as String)?.toList()
  ..ingredients = (json['ingredients'] as List)?.map((e) => e as String)?.toList();

abstract class _$RecipeModelSerializerMixin {
  String get title;
  String get image;
  String get time;
  String get people;
  String get level;
  String get cost;
  String get preparation;
  String get cooking;
  List<String> get steps;
  List<String> get ingredients;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('title', title);
    writeNotNull('image', image);
    writeNotNull('time', time);
    writeNotNull('people', people);
    writeNotNull('level', level);
    writeNotNull('cost', cost);
    writeNotNull('preparation', preparation);
    writeNotNull('cooking', cooking);
    writeNotNull('steps', steps);
    writeNotNull('ingredients', ingredients);
    return val;
  }
}

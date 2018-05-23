import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

@JsonSerializable(includeIfNull: false)
class RecipeModel extends Object with _$RecipeModelSerializerMixin {
  String title;
  String time;
  String people;
  String level;
  String cost;
  String preparation;
  String cooking;
  List<String> steps;
  List<String> ingredients;

  RecipeModel();

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);
}

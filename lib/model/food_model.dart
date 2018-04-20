import 'package:json_annotation/json_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable(includeIfNull: false)
class FoodModel extends Object with _$FoodModelSerializerMixin {
  String name;
  String type;
  double calories;
  double kilojoules;
  double lipids;
  double saturatedFats;
  double monoUnsaturatedFats;
  double polyUnsaturatedFats;
  double carbohydrates;
  double sugars;
  double proteins;
  double fibers;
  double cholesterol;
  double sodium;
  double water;

  FoodModel();

  factory FoodModel.fromJson(Map<String, dynamic> json) => _$FoodModelFromJson(json);
}

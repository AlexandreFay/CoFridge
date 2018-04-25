import 'package:cofridge/model/nutriment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable(includeIfNull: false)
class FoodModel extends Object with _$FoodModelSerializerMixin {
  int myQuantity;
  String code;
  String product_name_en;
  String image_url;
  NutrimentModel nutriments;

  FoodModel();

  factory FoodModel.fromJson(Map<String, dynamic> json) => _$FoodModelFromJson(json);
}

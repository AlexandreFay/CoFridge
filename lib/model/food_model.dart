import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_app/model/nutriment_model.dart';

part 'food_model.g.dart';

@JsonSerializable(includeIfNull: false)
class FoodModel extends Object with _$FoodModelSerializerMixin {
  String code;
  String product_name_en;
  String image_url;
  NutrimentModel nutriments;

  FoodModel();

  factory FoodModel.fromJson(Map<String, dynamic> json) => _$FoodModelFromJson(json);
}

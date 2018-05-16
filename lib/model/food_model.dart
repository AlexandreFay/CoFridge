import 'package:cofridge/model/nutriment_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'food_model.g.dart';

@JsonSerializable(includeIfNull: false)
class FoodModel extends Object with _$FoodModelSerializerMixin {
  String code;
  String product_name;
  String image_url;
  NutrimentModel nutriments;

  @JsonKey(fromJson: _quantityFromJson, toJson: _quantityToJson)
  BehaviorSubject<int> myQuantity;

  FoodModel();

  factory FoodModel.fromJson(Map<String, dynamic> json) => _$FoodModelFromJson(json);
}

BehaviorSubject<int> _quantityFromJson(int quantity) {
  BehaviorSubject<int> tmp;
  tmp = BehaviorSubject<int>();
  tmp.add(quantity);
  return tmp;
}

int _quantityToJson(BehaviorSubject<int> quantity) => quantity.value;

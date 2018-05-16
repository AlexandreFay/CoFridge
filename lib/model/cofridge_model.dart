import 'package:cofridge/model/food_model.dart';
import 'package:cofridge/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'cofridge_model.g.dart';

@JsonSerializable(includeIfNull: false)
class CoFridgeModel extends Object with _$CoFridgeModelSerializerMixin {
  @JsonKey(fromJson: _foodFromJson, toJson: _foodToJson)
  BehaviorSubject<List<FoodModel>> food;
  UserModel user;

  CoFridgeModel() {
    if (user == null) {
      food = new BehaviorSubject<List<FoodModel>>();
      food.add(<FoodModel>[]);
    }
    if (user == null) {
      user = new UserModel();
    }
  }

  factory CoFridgeModel.fromJson(Map<String, dynamic> json) => _$CoFridgeModelFromJson(json);
}

List<FoodModel> _foodToJson(BehaviorSubject<List<FoodModel>> food) => food.value;

BehaviorSubject<List<FoodModel>> _foodFromJson(List<FoodModel> food) {
  BehaviorSubject<List<FoodModel>> tmp;
  tmp = BehaviorSubject<List<FoodModel>>();
  tmp.add(food);
  return tmp;
}

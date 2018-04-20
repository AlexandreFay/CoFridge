import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_app/model/food_model.dart';
import 'package:mobile_app/model/user_model.dart';

part 'cofridge_model.g.dart';

@JsonSerializable(includeIfNull: false)
class CoFridgeModel extends Object with _$CoFridgeModelSerializerMixin {
  List<FoodModel> food;
  UserModel user;

  CoFridgeModel();

  factory CoFridgeModel.fromJson(Map<String, dynamic> json) => _$CoFridgeModelFromJson(json);
}

import 'dart:async';
import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/model/food_model.dart';
import 'package:cofridge/value/string.dart';
import 'package:cofridge/view/dialog_view.dart';
import 'package:cofridge/view/fridge_content_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

@immutable
class FridgeViewModel {
  final CoFridgeModel _model;

  FridgeViewModel({
    @required final CoFridgeModel model,
  })  : assert(model != null),
        _model = model;

  Future<Null> onTapFood({@required final BuildContext context, @required final FoodModel foodModel}) async {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => new FridgeContentView(
              viewModel: this,
              model: _model,
              currentFoodModel: foodModel,
            ),
        fullscreenDialog: true,
      ),
    );
  }

  Future<Null> navBack({@required final BuildContext context}) async {
    Navigator.pop(context);
  }

  Future<bool> remove({@required final FoodModel model}) async {
    if (model == null) {
      return false;
    }
    model.myQuantity.add(model.myQuantity.value - 1);
    if (model.myQuantity.value == 0) {
      final tmp = _model.food.value;
      tmp.remove(model);
      _model.food.add(tmp);
    }
    return true;
  }

  Future<bool> add({@required final FoodModel model, @required final bool contain}) async {
    if (model == null || model.product_name == null || model.product_name == "") {
      return false;
    }
    if (contain) {
      model.myQuantity.add(model.myQuantity.value + 1);
    } else {
      model.myQuantity.add(1);
      final tmp = _model.food.value;
      tmp.add(model);
      _model.food.add(tmp);
    }
    return true;
  }

  FoodModel contain({@required final String barcode}) {
    if (barcode == null || barcode == "") {
      return null;
    }
    for (final FoodModel tmp in _model.food.value) {
      if (tmp.code == barcode) {
        return tmp;
      }
    }
    return null;
  }

  Future<Null> scan({@required final BuildContext context}) async {
    try {
//      final String barcode = await BarcodeScanner.scan();
//      print("===> $barcode <===");

      /// Beure
//      final String barcode = "3155250364833";

      /// Coca Cola
      final String barcode = "5449000000996";
      FoodModel foodModel = contain(barcode: barcode);
      if (foodModel != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) => new DialogView(
                viewModel: this,
                foodModel: foodModel,
              ),
        );
        return null;
      }
      final http.Response response = await http.get("${MyString.foodUrl}$barcode.json");
      if (response.statusCode != 200) {
        return null;
      }
      foodModel = new FoodModel.fromJson(json.decode(response.body)['product']);
      add(model: foodModel, contain: false);
    }

    /// Check for errors
    on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        // FIXME Display nice error.
      } else {
        // FIXME Display nice error.
      }
      return null;
    }

    /// Check for format exceptions
    on FormatException {
      // FIXME Display nice error.
      return null;
    }

    /// Default error handler. Needs to be improved.
    catch (e) {
      // FIXME Display nice error.
      return null;
    }
  }
}

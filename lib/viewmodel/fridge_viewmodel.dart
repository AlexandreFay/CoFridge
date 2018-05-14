import 'dart:async';
import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/model/food_model.dart';
import 'package:cofridge/value/state.dart';
import 'package:cofridge/value/string.dart';
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

  Future<bool> remove({@required final FoodModel model}) async {
    for (int index = 0; index != _model.food.length; index++) {
      if (model.code == _model.food[index].code) {
        _model.food[index].myQuantity--;
        if (_model.food[index].myQuantity == 0) {
          _model.food.removeAt(index);
        }
        return SUCCESS;
      }
    }
    return FAILURE;
  }

  Future<bool> add({@required final FoodModel model}) async {
    for (final FoodModel tmpFood in _model.food) {
      if (model.code == tmpFood.code) {
        tmpFood.myQuantity++;
        return SUCCESS;
      }
    }
    model.myQuantity = 1;
    _model.food.add(model);
    return SUCCESS;
  }

  Future<Null> scan(EScan escan) async {
    try {
//      final String barcode = await BarcodeScanner.scan();
//      print("===> $barcode <===");

      /// Beure
//      final String barcode = "3155250364833";

      /// Coca Cola
      final String barcode = "5449000000996";
      final http.Response response = await http.get("${MyString.foodUrl}$barcode.json");
      if (response.statusCode != 200) {
        return null;
      }
      final FoodModel foodModel = new FoodModel.fromJson(json.decode(response.body)['product']);
      (escan == EScan.ADD) ? add(model: foodModel) : remove(model: foodModel);
      MyApp.state.setState(() {});
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

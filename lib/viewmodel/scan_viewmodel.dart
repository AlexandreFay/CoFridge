import 'dart:async';
import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/model/food_model.dart';
import 'package:cofridge/value/state.dart';
import 'package:cofridge/value/string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

@immutable
class ScanViewModel {
  final CoFridgeModel _model;

  ScanViewModel({
    @required final CoFridgeModel model,
  })  : assert(model != null),
        _model = model;

  bool remove({@required final FoodModel model}) {
    for (int index = 0; index != _model.food.length; index++) {
      if (model.code == _model.food[index].code) {
        _model.food[index].quantity--;
        if (_model.food[index].quantity == 0) {
          _model.food.removeAt(index);
        }
        return SUCCESS;
      }
    }
    return FAILURE;
  }

  bool add({@required final FoodModel model}) {
    for (final FoodModel tmpFood in _model.food) {
      if (model.code == tmpFood.code) {
        tmpFood.quantity++;
        return SUCCESS;
      }
    }
    _model.food.add(model);
    return SUCCESS;
  }

  Future<Null> scan() async {
    try {
//      final String barcode = await BarcodeScanner.scan();
//      print("===> $barcode <===");

      /// Coca Cola
      final String barcode = "5449000000996";
      final http.Response response = await http.get("${MyString.foodUrl}$barcode.json");
      return new FoodModel.fromJson(json.decode(response.body)['product']);
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

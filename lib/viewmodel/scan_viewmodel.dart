import 'dart:async';
import 'dart:convert';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/model/food_model.dart';
import 'package:mobile_app/value/string.dart';

@immutable
class ScanViewModel {
  Future<Null> scan() async {
    try {
//      final String barcode = await BarcodeScanner.scan();
//      print("===> $barcode <===");
      final String cocaColaBarcode = "5449000000996";
      final http.Response response = await http.get("${MyString.foodUrl}$cocaColaBarcode.json");
      final FoodModel foodModel = FoodModel.fromJson(json.decode(response.body)['product']);
      print(foodModel.product_name_en);
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

import 'package:cofridge/main.dart';
import 'package:cofridge/model/cofridge_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SignUpViewModel {
  void handleOnNav(BuildContext context) {
    run(model: new CoFridgeModel());
  }
}

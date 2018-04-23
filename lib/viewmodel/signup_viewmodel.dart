import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/main.dart';
import 'package:mobile_app/model/cofridge_model.dart';

@immutable
class SignUpViewModel {
  void handleOnNav(BuildContext context) {
    run(model: CoFridgeModel());
  }
}

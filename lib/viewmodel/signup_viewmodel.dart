import 'package:cofridge/main.dart';
import 'package:cofridge/model/cofridge_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SignUpViewModel {
  final CoFridgeModel _model;

  SignUpViewModel({
    @required final CoFridgeModel model,
  })  : assert(model != null),
        _model = model;

  void handleOnNav(BuildContext context) {
    run(model: _model);
  }
}

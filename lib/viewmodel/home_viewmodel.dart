import 'package:flutter/foundation.dart';
import 'package:mobile_app/model/cofridge_model.dart';

@immutable
class HomeViewModel {
  CoFridgeModel _model;

  HomeViewModel({
    CoFridgeModel model,
  })  : assert(model != null),
        _model = model;

  CoFridgeModel get model => _model;

  set model(CoFridgeModel value) => _model = value;
}

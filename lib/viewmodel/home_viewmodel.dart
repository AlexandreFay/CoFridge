import 'package:cofridge/model/cofridge_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class HomeViewModel {
  CoFridgeModel _model;

  HomeViewModel({
    @required final CoFridgeModel model,
  })  : assert(model != null),
        _model = model;

  CoFridgeModel get model => _model;

  set model(CoFridgeModel value) => _model = value;
}

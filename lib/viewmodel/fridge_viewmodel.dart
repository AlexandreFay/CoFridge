import 'package:cofridge/model/cofridge_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class FridgeViewModel {
  final CoFridgeModel _model;

  FridgeViewModel({
    @required final CoFridgeModel model,
  })  : assert(model != null),
        _model = model;
}

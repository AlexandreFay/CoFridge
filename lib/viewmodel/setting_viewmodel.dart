import 'package:cofridge/model/cofridge_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class SettingViewModel {
  final CoFridgeModel _model;

  SettingViewModel({
    @required final CoFridgeModel model,
  })  : assert(model != null),
        _model = model;
}

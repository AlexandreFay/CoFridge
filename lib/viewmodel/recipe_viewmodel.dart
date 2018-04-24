import 'package:cofridge/model/cofridge_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class RecipeViewModel {
  final CoFridgeModel _model;

  RecipeViewModel({
    @required final CoFridgeModel model,
  })  : assert(model != null),
        _model = model;
}

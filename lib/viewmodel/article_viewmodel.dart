import 'package:cofridge/model/cofridge_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class ArticleViewModel {
  final CoFridgeModel _model;

  ArticleViewModel({
    @required final CoFridgeModel model,
  })  : assert(model != null),
        _model = model;
}

import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/model/food_model.dart';
import 'package:cofridge/value/dimens.dart';
import 'package:cofridge/view/navigation_icon_view.dart';
import 'package:cofridge/viewmodel/scan_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class ScanView extends NavigationIconView {
  final ScanViewModel _viewModel;
  final CoFridgeModel _model;

  ScanView({
    @required final ScanViewModel viewModel,
    @required final CoFridgeModel model,
    @required final Widget icon,
    @required final String title,
    @required final TickerProvider vsync,
  })  : assert(viewModel != null),
        assert(model != null),
        assert(icon != null),
        assert(title?.isNotEmpty),
        _viewModel = viewModel,
        _model = model,
        super(icon: icon, title: title, vsync: vsync);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.only(
        top: MyDimens.dividerTop,
        right: MyDimens.dividerRight,
        bottom: MyDimens.dividerBottom,
        left: MyDimens.dividerLeft,
      ),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(
            child: new RaisedButton(
              onPressed: () => _viewModel.scan().then((FoodModel model) => _viewModel.add(model: model)),
              child: Text("Add"),
            ),
          ),
          new Expanded(
            child: new RaisedButton(
              onPressed: () => _viewModel.scan().then((FoodModel model) => _viewModel.remove(model: model)),
              child: Text("Remove"),
              ),
            ),
        ],
      ),
    );
  }
}

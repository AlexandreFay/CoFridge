import 'package:cofridge/model/cofridge_model.dart';
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
    return new Center(
      child: new RaisedButton(
        onPressed: _viewModel.scan,
        child: new Text("Scan"),
      ),
    );
  }
}

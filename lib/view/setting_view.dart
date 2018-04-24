import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/view/navigation_icon_view.dart';
import 'package:cofridge/viewmodel/setting_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SettingView extends NavigationIconView {
  final SettingViewModel _viewModel;
  final CoFridgeModel _model;

  SettingView({
    @required final SettingViewModel viewModel,
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
    // TODO: implement build
    return new Container();
  }
}

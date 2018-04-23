import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/view/navigation_icon_view.dart';
import 'package:mobile_app/viewmodel/setting_viewmodel.dart';

@immutable
class SettingView extends NavigationIconView {
  final SettingViewModel _viewModel;

  SettingView({
    @required final SettingViewModel viewModel,
    @required final Widget icon,
    @required final String title,
    @required final TickerProvider vsync,
  })  : assert(viewModel != null),
        assert(icon != null),
        assert(title?.isNotEmpty),
        _viewModel = viewModel,
        super(icon: icon, title: title, vsync: vsync);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}

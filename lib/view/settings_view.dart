import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/view/navigation_icon_view.dart';
import 'package:mobile_app/viewmodel/settings_viewmodel.dart';

@immutable
class SettingsView extends NavigationIconView {
  final SettingsViewModel _viewModel;

  SettingsView({
    @required SettingsViewModel viewModel,
    @required Widget icon,
    @required String title,
    @required Color color,
    @required TickerProvider vsync,
  })  : _viewModel = viewModel,
        super(icon: icon, title: title, color: color, vsync: vsync);

  @override
  Widget build() {
    // TODO: implement build
    return Container();
  }
}

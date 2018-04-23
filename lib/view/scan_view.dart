import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/view/navigation_icon_view.dart';
import 'package:mobile_app/viewmodel/scan_viewmodel.dart';

@immutable
class ScanView extends NavigationIconView {
  final ScanViewModel _viewModel;

  ScanView({
    @required final ScanViewModel viewModel,
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

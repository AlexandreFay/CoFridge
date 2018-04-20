import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/view/navigation_icon_view.dart';
import 'package:mobile_app/viewmodel/payment_viewmodel.dart';

@immutable
class PaymentView extends NavigationIconView {
  final PaymentViewModel _viewModel;

  PaymentView({
    @required PaymentViewModel viewModel,
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

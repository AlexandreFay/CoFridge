import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/value/state.dart';
import 'package:mobile_app/view/navigation_icon_view.dart';
import 'package:mobile_app/view/payment_view.dart';
import 'package:mobile_app/view/rental_view.dart';
import 'package:mobile_app/view/settings_view.dart';
import 'package:mobile_app/viewmodel/home_viewmodel.dart';
import 'package:mobile_app/viewmodel/payment_viewmodel.dart';
import 'package:mobile_app/viewmodel/rental_viewmodel.dart';
import 'package:mobile_app/viewmodel/settings_viewmodel.dart';

@immutable
class HomeView extends StatefulWidget {
  final HomeViewModel _viewModel;

  HomeView({
    @required HomeViewModel viewModel,
  })  : _viewModel = viewModel;

  @override
  State<StatefulWidget> createState() => MyState.state = HomeViewState();
}

@immutable
class HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  int _currentIndex = 0;
  final BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  final List<NavigationIconView> _views = <NavigationIconView>[];

  @override
  void initState() {
    super.initState();

    _views.addAll(
      <NavigationIconView>[
        RentalView(
          viewModel: RentalViewModel(),
          icon: Icon(Icons.home),
          title: "Home",
          color: Colors.black,
          vsync: this,
        ),
        PaymentView(
          viewModel: PaymentViewModel(),
          icon: Icon(Icons.payment),
          title: "Payment",
          color: Colors.white,
          vsync: this,
        ),
        SettingsView(
          viewModel: SettingsViewModel(),
          icon: Icon(Icons.settings),
          title: "Settings",
          color: Colors.white,
          vsync: this,
        ),
      ],
    );

    for (NavigationIconView view in _views) view.controller.addListener(_rebuild);

    _views[_currentIndex].controller.value = 1.0;
  }

  @override
  void dispose() {
    for (NavigationIconView view in _views) view.controller.dispose();
    super.dispose();
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }

  Widget _buildTransitionsStack() {
    final List<FadeTransition> transitions = <FadeTransition>[];

    for (NavigationIconView view in _views) transitions.add(view.transition(_type, context));

    // We want to have the newly animating (fading in) views on top.
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });

    return Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context) {
    MyState.context = context;
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _views.map((NavigationIconView navigationView) => navigationView.item).toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        setState(() {
          _views[_currentIndex].controller.reverse();
          _currentIndex = index;
          _views[_currentIndex].controller.forward();
        });
      },
    );

    return Scaffold(
      body: Center(child: _buildTransitionsStack()),
      bottomNavigationBar: botNavBar,
    );
  }
}

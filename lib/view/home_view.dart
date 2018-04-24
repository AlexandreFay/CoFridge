import 'package:cofridge/value/state.dart';
import 'package:cofridge/view/article_view.dart';
import 'package:cofridge/view/fridge_view.dart';
import 'package:cofridge/view/navigation_icon_view.dart';
import 'package:cofridge/view/recipe_view.dart';
import 'package:cofridge/view/scan_view.dart';
import 'package:cofridge/view/setting_view.dart';
import 'package:cofridge/viewmodel/article_viewmodel.dart';
import 'package:cofridge/viewmodel/fridge_viewmodel.dart';
import 'package:cofridge/viewmodel/home_viewmodel.dart';
import 'package:cofridge/viewmodel/recipe_viewmodel.dart';
import 'package:cofridge/viewmodel/scan_viewmodel.dart';
import 'package:cofridge/viewmodel/setting_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class HomeView extends StatefulWidget {
  final HomeViewModel _viewModel;

  HomeView({
    @required final HomeViewModel viewModel,
  })  : assert(viewModel != null),
        _viewModel = viewModel;

  @override
  State<StatefulWidget> createState() => MyApp.state = HomeViewState();
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
        new ArticleView(
          viewModel: new ArticleViewModel(),
          icon: new Icon(Icons.new_releases),
          title: "Article",
          vsync: this,
        ),
        new FridgeView(
          viewModel: new FridgeViewModel(),
          icon: Icon(Icons.list),
          title: "Fridge",
          vsync: this,
        ),
        new RecipeView(
          viewModel: new RecipeViewModel(),
          icon: Icon(Icons.book),
          title: "Recipe",
          vsync: this,
        ),
        new ScanView(
          viewModel: new ScanViewModel(),
          icon: new Icon(Icons.settings_overscan),
          title: "Scan",
          vsync: this,
        ),
        new SettingView(
          viewModel: new SettingViewModel(),
          icon: Icon(Icons.settings),
          title: "Setting",
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

    return new Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
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

    return new Scaffold(
      body: new Center(child: _buildTransitionsStack()),
      bottomNavigationBar: botNavBar,
    );
  }
}

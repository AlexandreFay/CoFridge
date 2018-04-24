import 'package:cofridge/view/navigation_icon_view.dart';
import 'package:cofridge/viewmodel/recipe_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class RecipeView extends NavigationIconView {
  final RecipeViewModel _viewModel;

  RecipeView({
    @required final RecipeViewModel viewModel,
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
    return new Container();
  }
}

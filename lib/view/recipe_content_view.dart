import 'package:cofridge/model/recipe_model.dart';
import 'package:cofridge/value/dimens.dart';
import 'package:cofridge/viewmodel/recipe_viewmodel.dart';
import 'package:flutter/material.dart';

class RecipeContentView extends StatelessWidget {
  final RecipeModel _recipeModel;
  final RecipeViewModel _viewModel;

  RecipeContentView({
    @required final RecipeModel recipeModel,
    @required final RecipeViewModel viewModel,
  })  : assert(recipeModel != null),
        assert(viewModel != null),
        _recipeModel = recipeModel,
        _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Recipe information"),
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(
              top: MyDimens.paddingTop,
              right: MyDimens.paddingRight,
              bottom: MyDimens.paddingBottom,
              left: MyDimens.paddingLeft,
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Text(
                  "Main Course",
                  textAlign: TextAlign.center,
                  style: textTheme.button.apply(color: Colors.orangeAccent),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: MyDimens.paddingTop),
                  child: new Text(
                    _recipeModel.title,
                    textAlign: TextAlign.center,
                    style: textTheme.subhead,
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: MyDimens.paddingTop),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Text(_recipeModel.level),
                      new Container(
                        color: Colors.black,
                        height: 24.0,
                        width: 1.0,
                      ),
                      new Text(_recipeModel.preparation),
                      new Container(
                        color: Colors.black,
                        height: 24.0,
                        width: 1.0,
                      ),
                      new Text(_recipeModel.cooking),
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: MyDimens.paddingTop),
                  child: new Text(
                    "Ingredients",
                    textAlign: TextAlign.center,
                    style: textTheme.subhead,
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: MyDimens.paddingTop),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _makeIngredients(context),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: MyDimens.paddingTop),
                  child: new Text(
                    "Steps",
                    textAlign: TextAlign.center,
                    style: textTheme.subhead,
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: MyDimens.paddingTop),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _makeSteps(context),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _makeIngredients(BuildContext context) {
    if (_recipeModel.ingredients == null) {
      return null;
    }
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final List<Widget> widgets = <Widget>[];
    for (final String ingredient in _recipeModel.ingredients) {
      final Widget widget = new Padding(
        padding: const EdgeInsets.only(top: MyDimens.paddingTop),
        child: new Text(ingredient),
      );
      widgets.add(widget);
    }
    return widgets;
  }

  List<Widget> _makeSteps(BuildContext context) {
    if (_recipeModel.steps == null) {
      return null;
    }
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final List<Widget> widgets = <Widget>[];
    for (final String step in _recipeModel.steps) {
      final TextStyle textStyle =
          (step.contains("step") == true || step.contains("Step") == true) ? textTheme.subhead : textTheme.body1;
      final Widget widget = new Padding(
        padding: const EdgeInsets.only(top: MyDimens.paddingTop),
        child: new Text(
          step,
          style: textStyle,
        ),
      );
      widgets.add(widget);
    }
    return widgets;
  }
}

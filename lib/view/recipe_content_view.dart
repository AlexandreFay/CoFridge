import 'package:cofridge/model/recipe_model.dart';
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Recipe information"),
      ),
      body: new ListView(),
    );
  }
}

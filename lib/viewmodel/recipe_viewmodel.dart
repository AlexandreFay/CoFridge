import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/model/recipe_model.dart';
import 'package:cofridge/view/recipe_content_view.dart';
import 'package:cofridge/view/recipedialog_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class RecipeViewModel {
  final CoFridgeModel _model;

  RecipeViewModel({
    @required final CoFridgeModel model,
  })  : assert(model != null),
        _model = model;

  void addRecipe({@required final BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) => new RecipeDialogView(
            viewModel: this,
          ),
    );
  }

  void navToRecipe(BuildContext context, RecipeModel recipeModel) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) => new RecipeContentView(
              viewModel: this,
              recipeModel: recipeModel,
            ),
        fullscreenDialog: true,
      ),
    );
  }
}

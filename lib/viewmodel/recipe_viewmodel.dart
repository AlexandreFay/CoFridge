import 'dart:async';

import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/model/recipe_model.dart';
import 'package:cofridge/value/state.dart';
import 'package:cofridge/view/recipedialog_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

@immutable
class RecipeViewModel {
  final CoFridgeModel _model;
  final RecipeModel _recipeModel;

  RecipeViewModel({
    @required final CoFridgeModel model,
  })  : assert(model != null),
        _model = model,
        _recipeModel = new RecipeModel();

  Future<Null> getRecipes() async {
    final http.Response response =
        await http.get("http://www.marmiton.org/recettes/recette_blanquette-de-veau-facile_19219.aspx");
    var document = parse(response.body);

    String getHtml({@required final String className}) {
      return document.getElementsByClassName(className)[0].outerHtml;
    }

    _recipeModel.title = getHtml(className: "main-title");
    _recipeModel.time = getHtml(className: "title-2 recipe-infos__total-time__value");
    _recipeModel.people = getHtml(className: "title-2 recipe-infos__quantity__value");
    // TODO: level
    // TODO: cost
    _recipeModel.prep = getHtml(className: "recipe-infos__timmings__preparation");
    _recipeModel.cookingTime = getHtml(className: "recipe-infos__timmings__cooking");
    _recipeModel.steps = getHtml(className: "recipe-preparation__list");
    _recipeModel.ingredients = getHtml(className: "recipe-ingredients__list");
    MyApp.state.setState(() {});
  }

  void addRecipe({@required final BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) => new RecipeDialogView(
        viewModel: this,
      ),
    );
  }

  RecipeModel get recipeModel => _recipeModel;
}

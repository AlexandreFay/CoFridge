import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/model/recipe_model.dart';
import 'package:cofridge/value/color.dart';
import 'package:cofridge/value/dimens.dart';
import 'package:cofridge/view/navigation_icon_view.dart';
import 'package:cofridge/viewmodel/recipe_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class RecipeView extends NavigationIconView {
  final RecipeViewModel _viewModel;
  final CoFridgeModel _model;

  RecipeView({
    @required final RecipeViewModel viewModel,
    @required final CoFridgeModel model,
    @required final Widget icon,
    @required final String title,
    @required final TickerProvider vsync,
  })  : assert(viewModel != null),
        assert(model != null),
        assert(icon != null),
        assert(title?.isNotEmpty),
        _viewModel = viewModel,
        _model = model,
        super(icon: icon, title: title, vsync: vsync);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Card(
          color: Colors.grey[200],
          child: new Padding(
            padding: new EdgeInsets.only(left: MyDimens.paddingLeft),
            child: new TextField(
              decoration: new InputDecoration(
                hintText: "Search recipe",
                hintStyle: new TextStyle(color: Colors.black54),
                icon: new Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(right: MyDimens.dividerRight),
            child: new Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) => _makeElement(context, index),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: MyColor.primaryColor,
        onPressed: () => _viewModel.addRecipe(context: context),
        child: new Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _makeElement(BuildContext context, int index) {
    if (index >= _model.recipes.length) {
      return null;
    }
    final RecipeModel recipeModel = _model.recipes[index];
    return new ListTile(
      title: new Text(recipeModel.title),
      onTap: () => _viewModel.navToRecipe(context, recipeModel),
    );
  }
}

import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/model/recipe_model.dart';
import 'package:cofridge/value/color.dart';
import 'package:cofridge/value/dimens.dart';
import 'package:cofridge/view/navigation_icon_view.dart';
import 'package:cofridge/viewmodel/recipe_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

@immutable
class RecipeView extends NavigationIconView {
  final RecipeViewModel _viewModel;
  final CoFridgeModel _model;
  final RecipeModel _recipeModel;

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
        assert(viewModel.recipeModel != null),
        _viewModel = viewModel,
        _model = model,
        _recipeModel = viewModel.recipeModel,
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
      body: new ListView(
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              (_recipeModel.title == null || _recipeModel.title == "")
                  ? new Container()
                  : new HtmlView(data: _recipeModel.title),
              (_recipeModel.ingredients == null || _recipeModel.ingredients == "")
                  ? new Container()
                  : new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new HtmlView(data: _recipeModel.ingredients),
                    ),
              (_recipeModel.steps == null || _recipeModel.steps == "")
                  ? new Container()
                  : new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new HtmlView(data: _recipeModel.steps),
                    ),
              new FlatButton(
                onPressed: () => _viewModel.getRecipes(),
                child: new Text("Get Recipes"),
              ),
            ],
          ),
        ],
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
}

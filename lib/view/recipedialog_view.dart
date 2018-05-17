import 'package:cofridge/viewmodel/recipe_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RecipeDialogView extends StatefulWidget {
  final RecipeViewModel _viewModel;

  RecipeDialogView({
    @required final RecipeViewModel viewModel,
  })  : assert(viewModel != null),
        _viewModel = viewModel;

  @override
  State<StatefulWidget> createState() =>
      new RecipeDialogViewState(viewModel: _viewModel);
}

class RecipeDialogViewState extends State<RecipeDialogView> {
  final RecipeViewModel _viewModel;
  final List<Widget> _widgetList = <Widget>[];
  int ingredientNum = 1;

  RecipeDialogViewState({
    @required final RecipeViewModel viewModel,
  })  : assert(viewModel != null),
        _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text("Create your recipe !"),
      content: new Container(
        color: Colors.white,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                hintText: "Title",
                hintStyle: new TextStyle(color: Colors.black54),
              ),
            ),
            new TextField(
              textAlign: TextAlign.center,
              decoration: new InputDecoration(
                hintText: "Ingredient " + ingredientNum.toString(),
                hintStyle: new TextStyle(color: Colors.black54),
              ),
            ),
            new Column(
              children: _widgetList,
            ),
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new FlatButton(
                    child: new Icon(
                      Icons.add,
                      color: Colors.greenAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        if (ingredientNum < 6) {
                          ingredientNum += 1;
                          _widgetList.add(new TextField(
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                              hintText:
                                  "Ingredient " + ingredientNum.toString(),
                              hintStyle: new TextStyle(color: Colors.black54),
                            ),
                          ));
                        }
                      });
                    },
                  ),
                  new FlatButton(
                      onPressed: () {},
                      child: new Icon(Icons.check, color: Colors.green),
                  )
                ]),
          ],
        ),
      ),
    );
  }
}

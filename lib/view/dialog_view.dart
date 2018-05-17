import 'package:cofridge/model/food_model.dart';
import 'package:cofridge/viewmodel/fridge_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DialogView extends StatelessWidget {
  final FridgeViewModel _viewModel;
  final FoodModel _foodModel;

  DialogView({
    @required final FridgeViewModel viewModel,
    @required final FoodModel foodModel,
  })  : assert(viewModel != null),
        assert(foodModel != null),
        _viewModel = viewModel,
        _foodModel = foodModel;

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text("Do you want to add or remove the food?"),
      content: new Container(
        color: Colors.white,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new FlatButton(
              child: new Icon(
                Icons.remove,
                color: Colors.redAccent,
              ),
              onPressed: () =>
                  _viewModel.remove(model: _foodModel).then((bool value) => _viewModel.navBack(context: context)),
            ),
            new FlatButton(
              child: new Icon(
                Icons.add,
                color: Colors.greenAccent,
              ),
              onPressed: () => _viewModel
                  .add(model: _foodModel, contain: true)
                  .then((bool value) => _viewModel.navBack(context: context)),
            ),
          ],
        ),
      ),
    );
  }
}

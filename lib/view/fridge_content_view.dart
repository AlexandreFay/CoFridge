import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/model/food_model.dart';
import 'package:cofridge/value/color.dart';
import 'package:cofridge/value/dimens.dart';
import 'package:cofridge/viewmodel/fridge_viewmodel.dart';
import 'package:flutter/material.dart';

class FridgeContentView extends StatelessWidget {
  final FridgeViewModel _viewModel;
  final CoFridgeModel _model;
  final FoodModel _currentFoodModel;

  FridgeContentView({
    @required final FridgeViewModel viewModel,
    @required final CoFridgeModel model,
    @required final FoodModel currentFoodModel,
  })  : assert(viewModel != null),
        assert(model != null),
        assert(currentFoodModel != null),
        _viewModel = viewModel,
        _model = model,
        _currentFoodModel = currentFoodModel;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Food information",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new Padding(
        padding: new EdgeInsets.symmetric(
          horizontal: MyDimens.paddingHorizontal,
          vertical: MyDimens.paddingVertical,
        ),
        child: new ListView(
          children: <Widget>[
            (_currentFoodModel?.image_url != null)
                ? new Center(
                    child: new Container(
                      width: 128.0,
                      height: 128.0,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new NetworkImage(_currentFoodModel.image_url),
                          fit: BoxFit.cover,
                        ),
                        color: MyColor.primaryColor,
                        borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
                      ),
                    ),
                  )
                : new Container(),
            (_currentFoodModel?.product_name != null)
                ? new Padding(
                    padding: new EdgeInsets.only(top: MyDimens.paddingTop),
                    child: new Text(
                      _currentFoodModel.product_name,
                      textAlign: TextAlign.center,
                      style: textTheme.subhead,
                    ),
                  )
                : new Container(),
            new Column(
              children: _buildNutriments(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildNutriments() {
    final List<Widget> widgets = <Widget>[];

    void insert({@required final String key, @required final String value}) {
      widgets.add(new ListTile(
        title: new Text(key),
        trailing: new Text(value),
      ));
    }

    String isValid({@required final String value, @required final String unit}) {
      return unit == null || unit == "" ? "$value ?" : "$value $unit";
    }

    insert(
      key: "Energy",
      value: isValid(
        value: _currentFoodModel.nutriments.energy_value,
        unit: _currentFoodModel.nutriments.energy_unit,
      ),
    );
    insert(
      key: "Fat",
      value: isValid(
        value: _currentFoodModel.nutriments.fat_value,
        unit: _currentFoodModel.nutriments.fat_unit,
      ),
    );
    insert(
      key: "Saturated Fat",
      value: isValid(
        value: _currentFoodModel.nutriments.saturatedFatValue,
        unit: _currentFoodModel.nutriments.saturatedFatUnit,
      ),
    );
    insert(
      key: "Carbohydrates",
      value: isValid(
        value: _currentFoodModel.nutriments.carbohydrates_value,
        unit: _currentFoodModel.nutriments.carbohydrates_unit,
      ),
    );
    insert(
      key: "Sugars",
      value: isValid(
        value: _currentFoodModel.nutriments.sugars_value,
        unit: _currentFoodModel.nutriments.sugars_unit,
      ),
    );
    insert(
      key: "Fibers",
      value: isValid(
        value: _currentFoodModel.nutriments.fiber_value,
        unit: _currentFoodModel.nutriments.fiber_unit,
      ),
    );
    insert(
      key: "Proteins",
      value: isValid(
        value: _currentFoodModel.nutriments.proteins_value,
        unit: _currentFoodModel.nutriments.proteins_unit,
      ),
    );
    insert(
      key: "Salt",
      value: isValid(
        value: _currentFoodModel.nutriments.salt_value,
        unit: _currentFoodModel.nutriments.salt_unit,
      ),
    );
    insert(
      key: "Sodium",
      value: isValid(
        value: _currentFoodModel.nutriments.sodium_value,
        unit: _currentFoodModel.nutriments.sodium_unit,
      ),
    );
    insert(
      key: "Score",
      value: _currentFoodModel.nutriments.nutritionScoreFr,
    );
    return widgets;
  }
}

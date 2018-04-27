import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/model/food_model.dart';
import 'package:cofridge/value/color.dart';
import 'package:cofridge/value/dimens.dart';
import 'package:cofridge/value/state.dart';
import 'package:cofridge/view/navigation_icon_view.dart';
import 'package:cofridge/viewmodel/fridge_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class FridgeView extends NavigationIconView {
  final FridgeViewModel _viewModel;
  final CoFridgeModel _model;

  FridgeView({
    @required final FridgeViewModel viewModel,
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
    // TODO: implement build
    return new Padding(
      padding: new EdgeInsets.only(
        top: MyDimens.dividerTop,
        right: MyDimens.dividerRight,
        bottom: MyDimens.dividerBottom,
        left: MyDimens.dividerLeft,
      ),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _getChildren(context),
      ),
    );
  }

  List<Widget> _getChildren(BuildContext context) {
    if (_model.food == null || _model.food.isEmpty) {
      return <Widget>[
        new Text(
          "No Food",
          textAlign: TextAlign.center,
        ),
      ];
    }

    List<Widget> foodWidgets = new List<Widget>();
    foodWidgets.addAll(_model.food.map((FoodModel foodModel) {
      return new ListTile(
        leading: new Image.network(
          foodModel.image_url,
          width: 24.0,
          height: 24.0,
        ),
        title: new Text(foodModel.product_name),
        trailing: new Text(foodModel.myQuantity.toString()),
      );
    }).toList());
    foodWidgets.add(
      new Expanded(
        child: new Container(
          alignment: Alignment.bottomRight,
          child: new FloatingActionButton(
            backgroundColor: MyColor.primaryColor,
            onPressed: () => _viewModel.scan(EScan.ADD),
            child: new Icon(Icons.settings_overscan),
          ),
        ),
      ),
    );
    return foodWidgets;
  }
}

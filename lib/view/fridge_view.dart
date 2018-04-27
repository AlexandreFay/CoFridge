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
      child: new ListView(
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _getChildren(context),
          ),
        ],
      ),
    );
  }

  Widget _getFloatingButton() {
    return new Expanded(
      child: new Container(
        alignment: Alignment.bottomRight,
        child: new FloatingActionButton(
          backgroundColor: MyColor.primaryColor,
          onPressed: () => _viewModel.scan(EScan.ADD),
          child: new Icon(Icons.settings_overscan),
        ),
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
        _getFloatingButton(),
      ];
    }

    List<Widget> foodWidgets = new List<Widget>();
    foodWidgets.addAll(_model.food.map((FoodModel foodModel) {
      if (foodModel?.product_name == null || foodModel?.product_name == "") {
        return new Container();
      }
      return new ListTile(
        leading: (foodModel?.image_url != null)
            ? new Image.network(
                foodModel.image_url,
                width: 24.0,
                height: 24.0,
              )
            : new Container(),
        title: (foodModel?.product_name != null) ? new Text(foodModel.product_name) : new Container(),
        trailing: (foodModel?.myQuantity?.toString() != null && foodModel?.myQuantity?.toString() != "")
            ? new Text(foodModel.myQuantity.toString())
            : new Container(),
      );
    }).toList());
    foodWidgets.add(_getFloatingButton());
    return foodWidgets;
  }
}

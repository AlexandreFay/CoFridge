import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/model/food_model.dart';
import 'package:cofridge/value/color.dart';
import 'package:cofridge/value/dimens.dart';
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Card(
          color: Colors.grey[200],
          child: new Padding(
            padding: new EdgeInsets.only(left: MyDimens.paddingLeft),
            child: new TextField(
              decoration: new InputDecoration(
                hintText: "Search food",
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
      body: new Padding(
        padding: new EdgeInsets.symmetric(
          horizontal: MyDimens.paddingHorizontal,
          vertical: MyDimens.paddingVertical,
        ),
        child: new ListView(
          children: _getChildren(context),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: MyColor.primaryColor,
        onPressed: () => _viewModel.scan(context: context),
        child: new Icon(
          Icons.settings_overscan,
          color: Colors.white,
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
            : new Icon(Icons.help_outline),
        title: new Text(foodModel.product_name),
        trailing: new Text(foodModel.quantity.toString()),
        onTap: () => _viewModel.onTapFood(context: context, foodModel: foodModel),
      );
    }).toList());
    return foodWidgets;
  }
}

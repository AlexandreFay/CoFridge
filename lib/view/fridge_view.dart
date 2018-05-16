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
        child: new StreamBuilder<List<FoodModel>>(
          stream: _model.food.stream,
          initialData: _model.food.value,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return new ListView.builder(
              itemBuilder: (BuildContext context, int index) => _makeElement(context, snapshot.data, index),
            );
          },
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        heroTag: "Scan",
        backgroundColor: MyColor.primaryColor,
        onPressed: () => _viewModel.scan(context: context),
        child: new Icon(
          Icons.settings_overscan,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _makeElement(BuildContext context, List<FoodModel> food, int index) {
    if (index >= food?.length) {
      return null;
    }
    final FoodModel foodModel = food[index];
    return new ListTile(
      leading: (foodModel?.image_url != null)
          ? new Image.network(
              foodModel.image_url,
              width: 24.0,
              height: 24.0,
            )
          : new Icon(Icons.help_outline),
      title: new Text(foodModel.product_name),
//        trailing: new Text(foodModel.quantity.toString()),
      trailing: new StreamBuilder<int>(
        stream: foodModel.myQuantity.stream,
        initialData: foodModel.myQuantity.value,
        builder: (context, snapshot) {
          return new Text(
            snapshot.data.toString(),
          );
        },
      ),
      onTap: () => _viewModel.onTapFood(context: context, foodModel: foodModel),
    );
  }
}

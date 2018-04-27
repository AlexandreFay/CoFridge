import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/model/food_model.dart';
import 'package:cofridge/value/color.dart';
import 'package:cofridge/value/dimens.dart';
import 'package:cofridge/value/state.dart';
import 'package:cofridge/view/navigation_icon_view.dart';
import 'package:cofridge/viewmodel/fridge_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum EView {
  FRIDGEVIEW,
  FRIDGECONTENTVIEW,
}

@immutable
class FridgeView extends NavigationIconView {
  final FridgeViewModel _viewModel;
  final CoFridgeModel _model;
  final Map<EView, Function(BuildContext)> _appBarFuncs = new Map<EView, Function(BuildContext)>();
  final Map<EView, Function(BuildContext)> _bodyFuncs = new Map<EView, Function(BuildContext)>();
  final Map<EView, Function(BuildContext)> _floatingButFuncs = new Map<EView, Function(BuildContext)>();
  EView _eView = EView.FRIDGEVIEW;
  FoodModel _currentFoodModel;

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
        super(icon: icon, title: title, vsync: vsync) {
    _bodyFuncs[EView.FRIDGEVIEW] = (BuildContext context) => _bodyFridgeView(context);
    _bodyFuncs[EView.FRIDGECONTENTVIEW] = (BuildContext context) => _bodyFridgeContentView(context);
    _appBarFuncs[EView.FRIDGEVIEW] = (BuildContext context) => _appBarFridgeView(context);
    _appBarFuncs[EView.FRIDGECONTENTVIEW] = (BuildContext context) => _appBarFridgeContentView(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _appBarFuncs[_eView](context),
      body: _bodyFuncs[_eView](context),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: MyColor.primaryColor,
        onPressed: () => _viewModel.scan(EScan.ADD),
        child: new Icon(
          Icons.settings_overscan,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _appBarFridgeContentView(BuildContext context) {
    return new AppBar(
      leading: new IconButton(
        icon: new Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          MyApp.state.setState(() {
            _eView = EView.FRIDGEVIEW;
          });
        },
      ),
      title: new Text(
        "Food information",
        style: new TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _appBarFridgeView(BuildContext context) {
    return new AppBar(
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
    );
  }

  Widget _bodyFridgeContentView(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return new Padding(
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
        ],
      ),
    );
  }

  Widget _bodyFridgeView(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.symmetric(
        horizontal: MyDimens.paddingHorizontal,
        vertical: MyDimens.paddingVertical,
      ),
      child: new ListView(
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
        onTap: () {
          MyApp.state.setState(() {
            _eView = EView.FRIDGECONTENTVIEW;
            _currentFoodModel = foodModel;
          });
        },
      );
    }).toList());
    return foodWidgets;
  }
}

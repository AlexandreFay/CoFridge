import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/value/color.dart';
import 'package:cofridge/view/navigation_icon_view.dart';
import 'package:cofridge/viewmodel/setting_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SettingView extends NavigationIconView {
  final SettingViewModel _viewModel;
  final CoFridgeModel _model;

  SettingView({
    @required final SettingViewModel viewModel,
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
      padding: const EdgeInsets.all(10.0),
      child: new ListView(
        children: <Widget>[
          new Center(
            child: new Container(
              width: 100.0,
              height: 100.0,
              child: new IconButton(
                icon: new Icon(Icons.person),
                iconSize: 75.0,
                onPressed: () {},
              ),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                border: new Border.all(
                  color: Colors.grey,
                  width: 3.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              'MARTINS Alexandre',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          new Divider(
            height: 1.0,
            color: Colors.black,
          ),
          new ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Télephone'),
            subtitle: const Text('0650492615'),
          ),
          new ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Magasin'),
            subtitle: const Text('Carrefour Glories'),
          ),
          new ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Nunéro carte de fidélité'),
            subtitle: const Text('754123545468'),
          ),
          new Divider(
            height: 1.0,
            color: Colors.black,
          ),
          new ListTile(
            leading: const Icon(Icons.phone),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Phone",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.email),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.credit_card),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Carte de fidélité",
              ),
            ),
          ),
          new Divider(
            height: 1.0,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new OutlineButton(
                      color: MyColor.primaryColor,
                      borderSide: new BorderSide(
                        color: MyColor.primaryColor,
                        width: 2.0,
                      ),
                      onPressed: () {},
                      child: new Text(
                        'Edit',
                        style: new TextStyle(
                          color: MyColor.primaryColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

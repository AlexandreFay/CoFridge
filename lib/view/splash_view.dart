import 'package:cofridge/value/color.dart';
import 'package:cofridge/value/dimens.dart';
import 'package:cofridge/view/loading_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SplashView extends StatelessWidget {
  final String _message;

  SplashView({
    @required final String message,
  })  : assert(message?.isNotEmpty),
        _message = message;

  @override
  Widget build(BuildContext context) {
    MyDimens.screenWidth = MediaQuery.of(context).size.width;
    MyDimens.screenHeight = MediaQuery.of(context).size.height;
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return new Scaffold(
      backgroundColor: MyColor.primaryColor,
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Image.asset(
            "asset/img/fridge.png",
            height: MyDimens.screenWidth * MyDimens.logoRatio,
            width: MyDimens.screenWidth * MyDimens.logoRatio,
          ),
          new Padding(
            padding: new EdgeInsets.only(top: MyDimens.dividerTop),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text("Co ", style: textTheme.display1.apply(color: Colors.white)),
                new Text("Fridge", style: textTheme.display1.apply(color: MyColor.accentColor)),
              ],
            ),
          ),
          new LoadingView(message: _message),
        ],
      ),
    );
  }
}

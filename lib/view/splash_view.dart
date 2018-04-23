import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/value/color.dart';
import 'package:mobile_app/value/dimens.dart';
import 'package:mobile_app/view/loading_view.dart';

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
    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "asset/img/fridge.png",
            height: MyDimens.screenWidth * MyDimens.logoRatio,
            width: MyDimens.screenWidth * MyDimens.logoRatio,
          ),
          Padding(
            padding: EdgeInsets.only(top: MyDimens.dividerTop),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Co ", style: textTheme.display1.apply(color: Colors.white)),
                Text("Fridge", style: textTheme.display1.apply(color: MyColor.accentColor)),
              ],
            ),
          ),
          LoadingView(message: _message),
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/value/dimens.dart';
import 'package:mobile_app/value/state.dart';
import 'package:mobile_app/view/loading_view.dart';

@immutable
class SplashView extends StatelessWidget {
  final String _message;

  SplashView({
    final String message,
  }) : _message = message;

  @override
  Widget build(BuildContext context) {
    MyState.context = context;
    MyDimens.screenWidth = MediaQuery.of(context).size.width;
    MyDimens.screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/rental-ninja-logo.png",
                height: MyDimens.screenWidth * MyDimens.sign_in_logo_ratio,
                width: MyDimens.screenWidth * MyDimens.sign_in_logo_ratio,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Rental ", style: Theme.of(context).textTheme.display1.apply(color: Colors.white)),
                  Text("Ninja", style: Theme.of(context).textTheme.display1.apply(color: Colors.redAccent)),
                ],
              ),
            ],
          ),
          LoadingView(message: _message),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}

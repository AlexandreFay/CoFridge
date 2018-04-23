import 'package:flutter/material.dart';
import 'package:mobile_app/value/color.dart';
import 'package:mobile_app/value/state.dart';
import 'package:mobile_app/view/splash_view.dart';

class SplashApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyState.state = SplashAppState();
}

class SplashAppState extends State<SplashApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "CoFridge",
        theme: MyColor.theme(context),
        home: SplashView(message: " "),
      );
}

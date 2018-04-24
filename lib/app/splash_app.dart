import 'package:cofridge/value/color.dart';
import 'package:cofridge/value/state.dart';
import 'package:cofridge/view/splash_view.dart';
import 'package:flutter/material.dart';

class SplashApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyApp.state = SplashAppState();
}

class SplashAppState extends State<SplashApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "CoFridge",
        theme: MyColor.theme(context),
        home: new SplashView(message: " "),
      );
}

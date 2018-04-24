import 'package:cofridge/value/color.dart';
import 'package:cofridge/value/state.dart';
import 'package:cofridge/view/signin_view.dart';
import 'package:cofridge/viewmodel/signin_viewmodel.dart';
import 'package:flutter/material.dart';

class SignInApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyApp.state = SignInAppState();
}

class SignInAppState extends State<SignInApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "CoFridge",
        theme: MyColor.theme(context),
        home: new SignInView(
          viewModel: new SignInViewModel(),
        ),
      );
}

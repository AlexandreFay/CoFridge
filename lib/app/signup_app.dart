import 'package:flutter/material.dart';
import 'package:mobile_app/value/color.dart';
import 'package:mobile_app/value/state.dart';
import 'package:mobile_app/view/signup_view.dart';
import 'package:mobile_app/viewmodel/signup_viewmodel.dart';

class SignUpApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyState.state = SignUpAppState();
}

class SignUpAppState extends State<SignUpApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "CoFridge",
        theme: MyColor.theme(context),
        home: SignUpView(
          viewModel: SignUpViewModel(),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:mobile_app/value/color.dart';
import 'package:mobile_app/value/state.dart';
import 'package:mobile_app/view/signin_view.dart';
import 'package:mobile_app/viewmodel/signin_viewmodel.dart';

class SignInApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyState.state = _SignInAppState();
}

class _SignInAppState extends State<SignInApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: "Rental Ninja Client",
      theme: theme(context),
      home: SignInView(
        viewModel: SignInViewModel(),
      ));
}

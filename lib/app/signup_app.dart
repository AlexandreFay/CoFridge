import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/value/color.dart';
import 'package:cofridge/value/state.dart';
import 'package:cofridge/view/signup_view.dart';
import 'package:cofridge/viewmodel/signup_viewmodel.dart';
import 'package:flutter/material.dart';

class SignUpApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyApp.state = SignUpAppState();
}

class SignUpAppState extends State<SignUpApp> {
  @override
  Widget build(BuildContext context) {
    final CoFridgeModel model = new CoFridgeModel();
    return MaterialApp(
      title: "CoFridge",
      theme: MyColor.theme(context),
      home: new SignUpView(
        viewModel: new SignUpViewModel(model: model),
        model: model,
      ),
    );
  }
}

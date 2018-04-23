import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/viewmodel/signup_viewmodel.dart';

@immutable
class SignUpView extends StatelessWidget {
  final SignUpViewModel _viewModel;

  SignUpView({
    @required final SignUpViewModel viewModel,
  })  : assert(viewModel != null),
        _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () => _viewModel.handleOnNav(context),
          child: Text("Home"),
        ),
      ),
    );
  }
}

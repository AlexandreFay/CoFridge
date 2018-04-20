import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/value/state.dart';
import 'package:mobile_app/viewmodel/signin_viewmodel.dart';

@immutable
class SignInView extends StatefulWidget {
  final SignInViewModel _viewModel;

  SignInView({
    SignInViewModel viewModel,
  }) : _viewModel = viewModel;

  @override
  State<StatefulWidget> createState() => MyState.state = SignInViewState();
}

class SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    MyState.context = context;
    return Container();
  }
}

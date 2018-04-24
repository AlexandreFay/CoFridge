import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/value/dimens.dart';
import 'package:mobile_app/viewmodel/signin_viewmodel.dart';

@immutable
class SignInView extends StatelessWidget {
  final SignInViewModel _viewModel;

  SignInView({
    @required final SignInViewModel viewModel,
  })  : assert(viewModel != null),
        _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MyDimens.dividerTop,
          right: MyDimens.dividerRight,
          bottom: MyDimens.dividerBottom,
          left: MyDimens.dividerLeft,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MyDimens.dividerTop),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MyDimens.dividerTop),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: null,
                    child: Text("Sign Up"),
                  ),
                  RaisedButton(
                    onPressed: () => _viewModel.handleOnNav(context),
                    child: Text("Sign In"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

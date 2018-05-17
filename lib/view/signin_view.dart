import 'package:cofridge/value/color.dart';
import 'package:cofridge/value/dimens.dart';
import 'package:cofridge/viewmodel/signin_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SignInView extends StatelessWidget {
  final SignInViewModel _viewModel;

  SignInView({
    @required final SignInViewModel viewModel,
  })  : assert(viewModel != null),
        _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return new Scaffold(
      body: new Padding(
        padding: new EdgeInsets.only(
          top: MyDimens.dividerTop,
          right: MyDimens.dividerRight,
          bottom: MyDimens.dividerBottom,
          left: MyDimens.dividerLeft,
        ),
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              "asset/img/Cofridge_Logo.png",
              height: MyDimens.screenWidth * MyDimens.logoRatio,
              width: MyDimens.screenWidth * MyDimens.logoRatio,
            ),
            new Padding(
              padding: new EdgeInsets.only(top: MyDimens.dividerTop),
              child: new TextField(
                decoration: new InputDecoration(
                  hintText: "Email",
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: MyDimens.dividerTop),
              child: new TextField(
                decoration: new InputDecoration(
                  hintText: "Password",
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: MyDimens.dividerTop),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: () => _viewModel.handleOnNav(context),
                    color: MyColor.primaryColor,
                    child: Text(
                      "Sign Up",
                      style: textTheme.button.copyWith(color: Colors.white),
                    ),
                  ),
                  new RaisedButton(
                    onPressed: null,
                    color: MyColor.primaryColor,
                    child: new Text(
                      "Sign In",
                      style: textTheme.button.copyWith(color: Colors.white),
                    ),
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

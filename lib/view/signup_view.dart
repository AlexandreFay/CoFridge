import 'package:cofridge/value/color.dart';
import 'package:cofridge/value/dimens.dart';
import 'package:cofridge/viewmodel/signup_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SignUpView extends StatelessWidget {
  final SignUpViewModel _viewModel;

  SignUpView({
    @required final SignUpViewModel viewModel,
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
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Image.asset(
              "asset/img/fridge.png",
              height: MyDimens.screenWidth * MyDimens.logoRatio,
              width: MyDimens.screenWidth * MyDimens.logoRatio,
            ),
            new Padding(
              padding: new EdgeInsets.only(top: MyDimens.dividerTop),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text("Co ", style: textTheme.display1),
                  new Text("Fridge", style: textTheme.display1.apply(color: MyColor.accentColor)),
                ],
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: MyDimens.dividerTop),
              child: new TextField(
                decoration: new InputDecoration(
                  hintText: "Name",
                ),
              ),
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
              child: new RaisedButton(
                onPressed: () => _viewModel.handleOnNav(context),
                child: new Text("Confirm"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

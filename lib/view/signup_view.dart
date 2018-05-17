import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/value/color.dart';
import 'package:cofridge/value/dimens.dart';
import 'package:cofridge/viewmodel/signup_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SignUpView extends StatelessWidget {
  final SignUpViewModel _viewModel;
  final CoFridgeModel _model;

  SignUpView({
    @required final SignUpViewModel viewModel,
    @required final CoFridgeModel model,
  })  : assert(viewModel != null),
        assert(model != null),
        _viewModel = viewModel,
        _model = model;

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
                  hintText: "Name",
                ),
                onChanged: (String name) => _model.user.name = name,
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: MyDimens.dividerTop),
              child: new TextField(
                decoration: new InputDecoration(
                  hintText: "Email",
                ),
                onChanged: (String email) => _model.user.email = email,
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: MyDimens.dividerTop),
              child: new TextField(
                decoration: new InputDecoration(
                  hintText: "Password",
                ),
                onChanged: (String password) => _model.user.password = password,
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: MyDimens.dividerTop),
              child: new RaisedButton(
                onPressed: () => _viewModel.handleOnNav(context),
                color: MyColor.primaryColor,
                child: new Text(
                  "Confirm",
                  style: textTheme.button.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

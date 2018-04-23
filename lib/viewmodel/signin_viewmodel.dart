import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/app/signup_app.dart';

@immutable
class SignInViewModel {
  void handleOnNav(BuildContext context) {
    runApp(SignUpApp());
  }
}

import 'package:cofridge/app/signup_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class SignInViewModel {
  void handleOnNav(BuildContext context) {
    runApp(SignUpApp());
  }
}

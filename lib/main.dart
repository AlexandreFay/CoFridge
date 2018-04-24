import 'dart:async';
import 'dart:convert';

import 'package:cofridge/app/cofridge_app.dart';
import 'package:cofridge/app/signin_app.dart';
import 'package:cofridge/app/splash_app.dart';
import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/viewmodel/home_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Starting point of the application
void main() async {
  /// Run the Splash Screen
  runApp(SplashApp());

  /// Wait for a little bit do display our nice logo...
  await Future.delayed(Duration(seconds: 1));

  /// Get the shared preferences where everything is stored, if logged in of course.
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String data = prefs.getString('data');
  CoFridgeModel model;

  if (data != null) {
    try {
      model = new CoFridgeModel.fromJson(json.decode(data));
    } catch (e) {
      // Nothing, continue
    }
  }

  /// If nothing is loaded... or error has been found
  /// run the log in screen as an app.
  if (model == null) {
    prefs.remove('data');
    runApp(new SignInApp());
  } else {
    /// Finally run the application
    run(model: model);
  }
}

/// Runs the real application given a ClientBookingData model
void run({@required CoFridgeModel model}) {
  runApp(new CoFridgeApp(
    viewModel: new HomeViewModel(model: model),
  ));
}

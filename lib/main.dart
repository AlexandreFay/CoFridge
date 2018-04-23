import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/app/cofridge_app.dart';
import 'package:mobile_app/app/signin_app.dart';
import 'package:mobile_app/app/splash_app.dart';
import 'package:mobile_app/model/cofridge_model.dart';
import 'package:mobile_app/viewmodel/home_viewmodel.dart';
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
      model = CoFridgeModel.fromJson(json.decode(data));
    } catch (e) {
      // Nothing, continue
    }
  }

  /// If nothing is loaded... or error has been found
  /// run the log in screen as an app.
  if (model == null) {
    prefs.remove('data');
    runApp(SignInApp());
  } else {
    /// Finally run the application
    run(model: model);
  }
}

/// Runs the real application given a ClientBookingData model
void run({@required CoFridgeModel model}) {
  runApp(CoFridgeApp(
    viewModel: HomeViewModel(model: model),
  ));
}

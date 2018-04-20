import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_app/app/rental_ninja_client_app.dart';
import 'package:mobile_app/app/sign_in_app.dart';
import 'package:mobile_app/app/splash_app.dart';
import 'package:mobile_app/model/cofridge_model.dart';
import 'package:mobile_app/viewmodel/home_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Headers to be used in api requests.
Map<String, String> get headers => {"Accept": "application/json", "Content-Type": "application/json"};

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
      if (data != null) {
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
      run(model, isFreshInfo: false);
    }
  }
}

/// Runs the real application given a ClientBookingData model
void run(CoFridgeModel model, {bool isFreshInfo: true}) {
  HomeViewModel viewModel = HomeViewModel(model: model);
  runApp(RentalNinjaClientApp(viewModel: viewModel, shouldLoadData: !isFreshInfo));
}

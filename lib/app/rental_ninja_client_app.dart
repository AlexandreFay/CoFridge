import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mobile_app/value/color.dart';
import 'package:mobile_app/value/state.dart';
import 'package:mobile_app/view/home_view.dart';
import 'package:mobile_app/viewmodel/home_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class RentalNinjaClientApp extends StatefulWidget {
  final HomeViewModel _viewModel;
  final bool _shouldLoadData;

  RentalNinjaClientApp({
    @required HomeViewModel viewModel,
    bool shouldLoadData: true,
  })  : _viewModel = viewModel,
        _shouldLoadData = shouldLoadData;

  @override
  State<StatefulWidget> createState() => MyState.state = RentalNinjaAppState();
}

class RentalNinjaAppState extends State<RentalNinjaClientApp> {
  @override
  void initState() {
    super.initState();

    // If we should be updating the information...
    if (widget._shouldLoadData == true) _saveData();

    // Fetch the data from the server every 5 minutes looking for changes.
    new Timer.periodic(Duration(minutes: 5), (_) => _saveData());
  }

  @override
  Widget build(BuildContext context) {
    MyState.context = context;

    return MaterialApp(title: "Rental Ninja Client", theme: theme(context), home: HomeView(viewModel: widget._viewModel));
  }

  /// Updates the data from the server.
  void _saveData() {
    print("Updating Data from the server now: ${DateTime.now()}"); // Some logging that needs to be removed in time.

    // obtain shared preferences
    SharedPreferences.getInstance().then((SharedPreferences prefs) => prefs.setString('data', json.encode(widget._viewModel.model)));
  }
}

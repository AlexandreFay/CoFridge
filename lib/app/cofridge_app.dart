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
class CoFridgeApp extends StatefulWidget {
  final HomeViewModel _viewModel;
  final bool _shouldSaveData;

  CoFridgeApp({
    @required final HomeViewModel viewModel,
    final bool shouldSaveData: true,
  })  : _viewModel = viewModel,
        _shouldSaveData = shouldSaveData;

  @override
  State<StatefulWidget> createState() => MyState.state = CoFridgeAppState();
}

class CoFridgeAppState extends State<CoFridgeApp> {
  @override
  void initState() {
    super.initState();

    // If we should be updating the information...
    if (widget._shouldSaveData == true) _saveData();

    // Fetch the data from the server every 5 minutes looking for changes.
    new Timer.periodic(Duration(minutes: 5), (_) => _saveData());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CoFridge",
      theme: MyColor.theme(context),
      home: HomeView(
        viewModel: widget._viewModel,
      ),
    );
  }

  /// Saves the data into shared preferences.
  void _saveData() {
    print("Saving Data into shared preferences now: ${DateTime.now()}");

    // obtain shared preferences
    SharedPreferences.getInstance().then((SharedPreferences prefs) => prefs.setString('data', json.encode(widget._viewModel.model)));
  }
}

import 'package:flutter/material.dart';

class MyColor {
  static final Color primaryColor = Colors.orangeAccent;

  static final Color accentColor = Colors.blueAccent;

  /// Theme
  static ThemeData theme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        accentColor: MyColor.accentColor,
        primaryColor: MyColor.primaryColor,
        textTheme: Theme.of(context).textTheme.copyWith(subhead: Theme.of(context).textTheme.subhead.apply(fontWeightDelta: 1)),
      );
}

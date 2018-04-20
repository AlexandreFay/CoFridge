import 'package:flutter/material.dart';

var accentColor = Colors.indigoAccent;

var primaryColor = Colors.indigoAccent;

/// Theme
ThemeData theme(BuildContext context) => ThemeData(
      accentColor: accentColor,
      primaryColor: primaryColor,
      textTheme: Theme.of(context).textTheme.copyWith(
            subhead: Theme.of(context).textTheme.subhead.apply(fontWeightDelta: 1),
          ),
    );

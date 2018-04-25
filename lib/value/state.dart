import 'package:cofridge/model/cofridge_model.dart';
import 'package:flutter/material.dart';

bool SUCCESS = true;
bool FAILURE = false;

enum EScan {
  ADD,
  REMOVE,
}

class MyApp {
  static State state;
  static CoFridgeModel coFridge;
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/value/state.dart';

@immutable
class LoadingView extends StatelessWidget {
  final String _message;

  LoadingView({
    String message,
  }) : _message = message;

  @override
  Widget build(BuildContext context) {
    MyState.context = context;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(30.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getChildren(),
        ),
      ),
    );
  }

  List<Widget> _getChildren() {
    List<Widget> children = List<Widget>();

    if (_message != null) {
      children.add(Padding(
        padding: EdgeInsets.only(top: 10.00, bottom: 10.00),
        child: Text(_message, style: TextStyle(fontSize: 20.00, color: Colors.white)),
      ));
    }
    children.add(CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
    ));

    return children;
  }
}

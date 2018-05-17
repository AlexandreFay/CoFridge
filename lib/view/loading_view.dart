import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class LoadingView extends StatelessWidget {
  final String _message;

  LoadingView({
    @required final String message,
  })  : assert(message?.isNotEmpty),
        _message = message;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Padding(
        padding: new EdgeInsets.all(30.00),
        child: new Column(
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
        padding: new EdgeInsets.only(top: 10.00, bottom: 10.00),
        child: new Text(_message,
            style: TextStyle(fontSize: 20.00, color: Colors.white)),
      ));
    }
    children.add(CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
    ));

    return children;
  }
}

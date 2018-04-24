import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NavigationIconView {
  final BottomNavigationBarItem _item;
  final AnimationController _controller;

  NavigationIconView({
    @required final Widget icon,
    @required final String title,
    @required final TickerProvider vsync,
  })  : _item = new BottomNavigationBarItem(icon: icon, title: Text(title)),
        _controller = new AnimationController(duration: kThemeAnimationDuration, vsync: vsync);

  AnimationController get controller => _controller;

  BottomNavigationBarItem get item => _item;

  Widget build(BuildContext context);

  CurvedAnimation get _animation => new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ));

  FadeTransition transition(BottomNavigationBarType type, BuildContext context) {
    return new FadeTransition(
      opacity: _animation,
      child: new SlideTransition(
        position: new Tween<Offset>(begin: Offset(0.0, 0.02), end: Offset.zero).animate(_animation),
        child: build(context),
      ),
    );
  }
}

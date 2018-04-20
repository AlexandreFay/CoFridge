import 'package:flutter/material.dart';

abstract class NavigationIconView {
  final Widget _icon;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem _item;
  final AnimationController _controller;

  NavigationIconView({
    Widget icon,
    String title,
    Color color,
    TickerProvider vsync,
  })  : _icon = icon,
        _color = color,
        _title = title,
        _item = BottomNavigationBarItem(icon: icon, title: Text(title), backgroundColor: color),
        _controller = AnimationController(duration: kThemeAnimationDuration, vsync: vsync);

  AnimationController get controller => _controller;

  BottomNavigationBarItem get item => _item;

  Widget build();

  CurvedAnimation get _animation => CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ));

  FadeTransition transition(BottomNavigationBarType type, BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(begin: Offset(0.0, 0.02), end: Offset.zero).animate(_animation),
        child: build(),
      ),
    );
  }
}

import 'package:cofridge/view/navigation_icon_view.dart';
import 'package:cofridge/viewmodel/article_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class ArticleView extends NavigationIconView {
  final ArticleViewModel _viewModel;

  ArticleView({
    @required final ArticleViewModel viewModel,
    @required final Widget icon,
    @required final String title,
    @required final TickerProvider vsync,
  })  : assert(viewModel != null),
        assert(icon != null),
        assert(title?.isNotEmpty),
        _viewModel = viewModel,
        super(icon: icon, title: title, vsync: vsync);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container();
  }
}

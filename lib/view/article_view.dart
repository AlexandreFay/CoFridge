import 'package:cofridge/model/cofridge_model.dart';
import 'package:cofridge/view/navigation_icon_view.dart';
import 'package:cofridge/viewmodel/article_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

@immutable
class ArticleView extends NavigationIconView {
  final ArticleViewModel _viewModel;
  final CoFridgeModel _model;

  ArticleView({
    @required final ArticleViewModel viewModel,
    @required final CoFridgeModel model,
    @required final Widget icon,
    @required final String title,
    @required final TickerProvider vsync,
  })  : assert(viewModel != null),
        assert(model != null),
        assert(icon != null),
        assert(title?.isNotEmpty),
        _viewModel = viewModel,
        _model = model,
        super(icon: icon, title: title, vsync: vsync);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              'Article en promotion :',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          new Divider(
            height: 1.0,
            color: Colors.black,
          ),
          new ListTile(
            leading: new Image.network(
                'https://www.saint-vincentbio.com/wp-content/uploads/2014/05/carre-veau-biologique.jpg'),
            title: const Text('Veau - 500 G - 50% Réduction'),
            subtitle: const Text('Carrefour Rambla'),
          ),
          new ListTile(
            leading: new Image.network(
                'https://www.passionfroid.fr/images/beurre-micropain-doux-82-mg-10-g-paysan-breton-0019305-0-passionfroid-grossiste-alimentaire-504-110216.jpg'),
            title: const Text('Beurre - 200 G - 5% Réduction'),
            subtitle: const Text('Carrefour Rambla'),
          ),
          new ListTile(
            leading: new Image.network(
                'http://www.francine.com/images/content/produits/listes/farine-de-bl-francine_1.jpg'),
            title: const Text('Farine - 1 KG - 20% Réduction'),
            subtitle: const Text('Carrefour Rambla'),
          ),
          new ListTile(
            leading: new Image.network(
                'http://www.saladexpress.ca/images/made/images/generic/carottes_400_265.jpg'),
            title: const Text('Carrote - 0.15€ / Unité'),
            subtitle: const Text('Carrefour Rambla'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              'Articles intéressants du moment :',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          new Divider(
            height: 1.0,
            color: Colors.black,
          ),
          new ListTile(
            leading: new Image.network(
                'https://www.wenow.com/wp-content/uploads/2017/02/le-monde-1.jpg'),
            title: const Text(
                '41,2 tonnes de nourriture jetées chaque seconde dans le monde'),
            onTap: () {
              _launchURL(
                  "http://www.lemonde.fr/les-decodeurs/article/2017/10/16/gaspillage-41-2-tonnes-de-nourriture-jetees-chaque-seconde-dans-le-monde_5201728_4355770.html");
            },
          ),
          new ListTile(
            leading: new Image.network(
                'https://www.bbcgoodfood.com/sites/default/files/new-logo-main.jpg'),
            title: const Text('How to reduce food waste'),
            onTap: () {
              _launchURL(
                  "https://www.bbcgoodfood.com/howto/guide/how-reduce-food-waste");
            },
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

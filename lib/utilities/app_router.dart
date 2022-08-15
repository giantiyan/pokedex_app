import 'package:flutter/material.dart';
import 'package:pokedex/features/details_page/details_page_connector.dart';
import 'package:pokedex/features/home_page/home_page_connector.dart';

final mainNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // HomePageConnector widget (initial route)
      case HomePageConnector.route:
        return MaterialPageRoute(builder: (_) => HomePageConnector());

      // DetailsPageConnector widget, when the user taps on a Pokemon Tile
      case DetailsPageConnector.route:
        return MaterialPageRoute(
            builder: (_) => DetailsPageConnector(args: settings.arguments as DetailsPageConnectorArgs));

      // Default route
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

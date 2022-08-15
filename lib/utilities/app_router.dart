import 'package:flutter/material.dart';
import 'package:pokedex/features/details_page/details_page_connector.dart';
import 'package:pokedex/features/home_page/home_page_connector.dart';

final mainNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePageConnector.route:
        return MaterialPageRoute(builder: (_) => HomePageConnector());

      case DetailsPageConnector.route:
        return MaterialPageRoute(
            builder: (_) => DetailsPageConnector(args: settings.arguments as DetailsPageConnectorArgs));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

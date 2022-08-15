import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/home_page/home_page_connector.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utilities/app_router.dart';
import 'package:pokedex/utilities/theme.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({required this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: theme,
        home: Navigator(
          key: mainNavigatorKey, // This is the key in the AppRouter
          initialRoute: HomePageConnector.route, // Initial route
          onGenerateRoute: AppRouter.generateRoute, // This is the method under AppRouter that generates routes
        ),
      ),
    );
  }
}

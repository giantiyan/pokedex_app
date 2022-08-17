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
          key: mainNavigatorKey,
          initialRoute: HomePageConnector.route,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}

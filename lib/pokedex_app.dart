import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/home_page/home_page_connector.dart';
import 'package:pokedex/state/app_state.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({required this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        home: const HomePageConnector(),
      ),
    );
  }
}

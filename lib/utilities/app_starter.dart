import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokedex_app.dart';
import 'package:pokedex/state/app_state.dart';

void appStarter() {
  WidgetsFlutterBinding.ensureInitialized();

  final store = Store<AppState>(
    initialState: AppState.init(),
    actionObservers: [Log.printer(formatter: Log.verySimpleFormatter)],
  );

  runApp(PokedexApp(store: store));
}

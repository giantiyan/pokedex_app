import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/api/api_service.dart';
import 'package:pokedex/pokedex_app.dart';
import 'package:pokedex/state/app_state.dart';

final getIt = GetIt.instance;

void appStarter() {
  WidgetsFlutterBinding.ensureInitialized();

  final store = Store<AppState>(
    initialState: AppState.init(),
    actionObservers: [Log.printer(formatter: Log.verySimpleFormatter)],
  );

  getIt.registerLazySingleton<ApiService>(() => ApiService());

  runApp(PokedexApp(store: store));
}

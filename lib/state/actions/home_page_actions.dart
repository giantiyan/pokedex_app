import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/handlers/pokemon_handler.dart';
import 'package:pokedex/state/app_state.dart';

class GetPokemonAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final pokemon = await PokemonHandler.getPokemon();
    return state.copyWith(pokemon: pokemon);
  }
}

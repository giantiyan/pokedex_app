import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/handlers/pokemon_handler.dart';
import 'package:pokedex/state/app_state.dart';

/// Get pokemon types and save it to the state
class GetPokemonTypesAction extends ReduxAction<AppState> {
  GetPokemonTypesAction(this.pokemonURL);

  final String? pokemonURL;

  @override
  Future<AppState> reduce() async {
    final types = await PokemonHandler.getPokemonType(pokemonURL!);
    return state.copyWith(types: types);
  }
}

/// Get pokemon about details and save it to the state
class GetPokemonAboutAction extends ReduxAction<AppState> {
  GetPokemonAboutAction(this.pokemonURL);

  final String? pokemonURL;

  @override
  Future<AppState> reduce() async {
    final about = await PokemonHandler.getPokemonAbout(pokemonURL!);
    return state.copyWith(about: about);
  }
}
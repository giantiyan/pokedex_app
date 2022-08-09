import 'dart:async';

import 'package:pokedex/api/handlers/pokemon_handler.dart';
import 'package:pokedex/state/actions/actions.dart';
import 'package:pokedex/state/app_state.dart';

const getPokemonListKey = 'get-pokemon-list-key';
const filterPokemonListKey = 'filter-pokemon-list-key';

/// Get pokemon and save it to the state
class GetPokemonAction extends LoadingAction {
  GetPokemonAction() : super(actionKey: getPokemonListKey);

  @override
  Future<AppState> reduce() async {
    final pokemon = await PokemonHandler.getPokemon();
    return state.copyWith(
      pokemon: pokemon,
      isVisible: false,
    );
  }
}

/// Get pokemon and save it to the state
class FilterPokemonAction extends LoadingAction {
  FilterPokemonAction(this.pokemonType)
      : super(actionKey: filterPokemonListKey);

  final String? pokemonType;

  @override
  Future<AppState> reduce() async {
    final pokemon = await PokemonHandler.filterPokemon(pokemonType!);
    return state.copyWith(
      pokemon: pokemon,
      isVisible: true,
    );
  }
}

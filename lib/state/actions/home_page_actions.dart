import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/handlers/pokemon_handler.dart';
import 'package:pokedex/state/actions/actions.dart';
import 'package:pokedex/state/app_state.dart';

const getPokemonListKey = 'get-pokemon-list-key';
const filterPokemonListKey = 'filter-pokemon-list-key';

/// Get pokemons and save it to the state
class GetPokemonAction extends LoadingAction {
  GetPokemonAction() : super(actionKey: getPokemonListKey);

  @override
  void before() {
    dispatch(ChangeFilterCancelVisibilityAction(isVisible: false));
    super.before();
  }

  @override
  Future<AppState> reduce() async {
    final pokemon = await PokemonHandler.getPokemon();
    return state.copyWith(pokemon: pokemon);
  }
}

/// Filter pokemons and save it to the state
class FilterPokemonAction extends LoadingAction {
  FilterPokemonAction(this.pokemonType)
      : super(actionKey: filterPokemonListKey);

  final String? pokemonType;

  @override
  Future<AppState> reduce() async {
    final pokemon = await PokemonHandler.filterPokemon(pokemonType!);
    return state.copyWith(pokemon: pokemon);
  }

  @override
  void after() {
    dispatch(ChangeFilterCancelVisibilityAction(isVisible: true));
    super.after();
  }
}

/// Change visibility of cancel button and save it to the state
class ChangeFilterCancelVisibilityAction extends ReduxAction<AppState> {
  ChangeFilterCancelVisibilityAction({this.isVisible});

  final bool? isVisible;

  @override
  AppState reduce() => state.copyWith(isVisible: isVisible);
}

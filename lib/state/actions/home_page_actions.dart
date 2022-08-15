import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/api_service.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/state/actions/actions.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utilities/app_starter.dart';

const getPokemonListKey = 'get-pokemon-list-key';
const searchPokemonListKey = 'search-pokemon-list-key';
const filterPokemonListKey = 'filter-pokemon-list-key';

/// Get pokemons and save it to the state
class GetPokemonAction extends LoadingAction {
  GetPokemonAction() : super(actionKey: getPokemonListKey);

  @override
  void before() {
    dispatch(ChangeFilterCancelVisibilityAction(isFilterButtonVisible: false));
    super.before();
  }

  @override
  Future<AppState> reduce() async {
    final pokemon = await getIt<ApiService>().pokemonApi.getPokemon();
    return state.copyWith(pokemon: pokemon);
  }

  @override
  void after() {
    dispatch(ClearSearchPokemonAction());
    super.after();
  }
}

/// Search pokemons and save it to the state
class SearchPokemonAction extends ReduxAction<AppState> {
  SearchPokemonAction(this.searchedPokemon);

  final List<PokemonModel>? searchedPokemon;

  @override
  AppState reduce() => state.copyWith(searchedPokemon: searchedPokemon);
}

/// Clear searched pokemons and save it to the state
class ClearSearchPokemonAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copyWith(searchedPokemon: null);
}

/// Filter pokemons and save it to the state
class FilterPokemonAction extends LoadingAction {
  FilterPokemonAction(this.pokemonType) : super(actionKey: filterPokemonListKey);

  final String? pokemonType;

  @override
  void before() {
    dispatch(ClearSearchPokemonAction());
    super.before();
  }

  @override
  Future<AppState> reduce() async {
    final pokemon = await getIt<ApiService>().pokemonApi.filterPokemon(pokemonType!);
    return state.copyWith(pokemon: pokemon);
  }

  @override
  void after() {
    dispatch(ChangeFilterCancelVisibilityAction(isFilterButtonVisible: true));
    super.after();
  }
}

/// Change visibility of cancel button and save it to the state
class ChangeFilterCancelVisibilityAction extends ReduxAction<AppState> {
  ChangeFilterCancelVisibilityAction({this.isFilterButtonVisible});

  final bool? isFilterButtonVisible;

  @override
  AppState reduce() => state.copyWith(isFilterButtonVisible: isFilterButtonVisible);
}

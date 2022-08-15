import 'dart:async';

import 'package:pokedex/api/api_service.dart';
import 'package:pokedex/state/actions/actions.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utilities/app_starter.dart';

const getPokemonTypesKey = 'get_pokemon_types_key';
const getPokemonAboutKey = 'get_pokemon_about_key';
const getPokemonBaseStatsKey = 'get_pokemon_base_stats_key';
const getPokemonEvolutionKey = 'get_pokemon_evolution_key';
const getPokemonMovesKey = 'get_pokemon_moves_key';

/// Get pokemon types and save it to the state
class GetPokemonTypesAction extends LoadingAction {
  GetPokemonTypesAction(this.pokemonId) : super(actionKey: getPokemonTypesKey);

  final int? pokemonId;

  @override
  Future<AppState> reduce() async {
    final types = await getIt<ApiService>().pokemonApi.getPokemonType(pokemonId!);
    return state.copyWith(types: types);
  }
}

/// Get pokemon about details and save it to the state
class GetPokemonAboutAction extends LoadingAction {
  GetPokemonAboutAction(this.pokemonId) : super(actionKey: getPokemonAboutKey);

  final int? pokemonId;

  @override
  Future<AppState> reduce() async {
    final about = await getIt<ApiService>().pokemonApi.getPokemonAbout(pokemonId!);
    return state.copyWith(about: about);
  }
}

/// Get pokemon base stats details and save it to the state
class GetPokemonBaseStatsAction extends LoadingAction {
  GetPokemonBaseStatsAction(this.pokemonId) : super(actionKey: getPokemonBaseStatsKey);

  final int? pokemonId;

  @override
  Future<AppState?> reduce() async {
    final baseStats = await getIt<ApiService>().pokemonApi.getPokemonBaseStats(pokemonId!);
    return state.copyWith(baseStats: baseStats);
  }
}

/// Get pokemon evolution details and save it to the state
class GetPokemonEvolutionChainAction extends LoadingAction {
  GetPokemonEvolutionChainAction(this.pokemonId) : super(actionKey: getPokemonEvolutionKey);

  final int? pokemonId;

  @override
  Future<AppState?> reduce() async {
    final evolutions = await getIt<ApiService>().pokemonApi.getPokemonEvolutionChain(pokemonId!);
    return state.copyWith(evolutions: evolutions);
  }
}

/// Get pokemon moves details and save it to the state
class GetPokemonMovesAction extends LoadingAction {
  GetPokemonMovesAction(this.pokemonId) : super(actionKey: getPokemonMovesKey);

  final int? pokemonId;

  @override
  Future<AppState?> reduce() async {
    final moves = await getIt<ApiService>().pokemonApi.getPokemonMoves(pokemonId!);
    return state.copyWith(moves: moves);
  }
}

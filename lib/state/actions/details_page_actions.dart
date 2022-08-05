import 'dart:async';

import 'package:pokedex/api/handlers/pokemon_handler.dart';
import 'package:pokedex/state/actions/actions.dart';
import 'package:pokedex/state/app_state.dart';

const getPokemonTypesKey = 'get_pokemon_types_key';
const getPokemonAboutKey = 'get_pokemon_about_key';
const getPokemonBaseStatsKey = 'get_pokemon_base_stats_key';
const getPokemonEvolutionKey = 'get_pokemon_evolution_key';
const getPokemonMovesKey = 'get_pokemon_moves_key';

/// Get pokemon types and save it to the state
class GetPokemonTypesAction extends LoadingAction {
  GetPokemonTypesAction(this.pokemonURL) : super(actionKey: getPokemonTypesKey);

  final String? pokemonURL;

  @override
  Future<AppState> reduce() async {
    final types = await PokemonHandler.getPokemonType(pokemonURL!);
    return state.copyWith(types: types);
  }
}

/// Get pokemon about details and save it to the state
class GetPokemonAboutAction extends LoadingAction {
  GetPokemonAboutAction(this.pokemonURL) : super(actionKey: getPokemonAboutKey);

  final String? pokemonURL;

  @override
  Future<AppState> reduce() async {
    final about = await PokemonHandler.getPokemonAbout(pokemonURL!);
    return state.copyWith(about: about);
  }
}

/// Get pokemon base stats details and save it to the state
class GetPokemonBaseStatsAction extends LoadingAction {
  GetPokemonBaseStatsAction(this.pokemonURL)
      : super(actionKey: getPokemonBaseStatsKey);

  final String? pokemonURL;

  @override
  Future<AppState?> reduce() async {
    final baseStats = await PokemonHandler.getPokemonBaseStats(pokemonURL!);
    return state.copyWith(base_stats: baseStats);
  }
}

/// Get pokemon evolution details and save it to the state
class GetPokemonEvolutionChainAction extends LoadingAction {
  GetPokemonEvolutionChainAction(this.pokemonId)
      : super(actionKey: getPokemonEvolutionKey);

  final int? pokemonId;

  @override
  Future<AppState?> reduce() async {
    final evolutions =
        await PokemonHandler.getPokemonEvolutionChain(pokemonId!);
    return state.copyWith(evolutions: evolutions);
  }
}

/// Get pokemon moves details and save it to the state
class GetPokemonMovesAction extends LoadingAction {
  GetPokemonMovesAction(this.pokemonURL) : super(actionKey: getPokemonMovesKey);

  final String? pokemonURL;

  @override
  Future<AppState?> reduce() async {
    final moves = await PokemonHandler.getPokemonMoves(pokemonURL!);
    return state.copyWith(moves: moves);
  }
}

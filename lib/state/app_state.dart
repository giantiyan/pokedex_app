import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/api/models/pokemon_type_model.dart';
import 'package:pokedex/api/models/pokemon_about_model.dart';
import 'package:pokedex/api/models/pokemon_base_stats_model.dart';
import 'package:pokedex/api/models/pokemon_evolutions_model.dart';
import 'package:pokedex/api/models/pokemon_moves_model.dart';
import 'package:async_redux/async_redux.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @JsonKey(name: 'pokemon') List<PokemonModel>? pokemon,
    @JsonKey(name: 'specific_pokemon') PokemonModel? specificPokemon,
    @JsonKey(name: 'types') List<PokemonTypeModel>? types,
    @JsonKey(name: 'about') PokemonAboutModel? about,
    @JsonKey(name: 'base_stats') PokemonBaseStatsModel? base_stats,
    @JsonKey(name: 'evolutions') PokemonEvolutionsModel? evolutions,
    @JsonKey(name: 'moves') PokemonMovesModel? moves,
    @Default(false) @JsonKey(name: 'isVisible') bool? isVisible,
    @JsonKey(name: 'searchedPokemon') List<PokemonModel>? searchedPokemon,
    @Default(Wait.empty) @JsonKey(name: 'wait', ignore: true) Wait wait,
  }) = _AppState;

  factory AppState.init() => AppState(
        pokemon: List.empty(),
        wait: Wait(),
      );

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}

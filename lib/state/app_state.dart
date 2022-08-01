import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/api/models/pokemon_type_model.dart';
import 'package:pokedex/api/models/pokemon_about_model.dart';
import 'package:pokedex/api/models/pokemon_base_stats_model.dart';
import 'package:pokedex/api/models/pokemon_moves_model.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @JsonKey(name: 'pokemon') List<PokemonModel>? pokemon,
    @JsonKey(name: 'types') List<PokemonTypeModel>? types,
  }) = _AppState;

  factory AppState.init() => AppState(pokemon: List.empty());

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
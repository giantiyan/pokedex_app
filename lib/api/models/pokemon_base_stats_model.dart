import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_base_stats_model.freezed.dart';

part 'pokemon_base_stats_model.g.dart';

@freezed
class PokemonBaseStatsModel with _$PokemonBaseStatsModel {
  factory PokemonBaseStatsModel({
    @JsonKey(name: 'base_stat') List<String>? base_stat,
    @JsonKey(name: 'name') List<String>? name,
  }) = _PokemonBaseStatsModel;

  factory PokemonBaseStatsModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonBaseStatsModelFromJson(json);
}

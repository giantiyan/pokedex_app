import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_base_stat_model.freezed.dart';

part 'pokemon_base_stat_model.g.dart';

@freezed
class PokemonBaseStatModel with _$PokemonBaseStatModel {
  factory PokemonBaseStatModel({
    @JsonKey(name: 'base_stat') int? baseStat,
  }) = _PokemonBaseStatModel;

  factory PokemonBaseStatModel.fromJson(Map<String, dynamic> json) => _$PokemonBaseStatModelFromJson(json);
}

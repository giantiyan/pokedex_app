import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/models/pokemon_model.dart';

part 'pokemon_evolutions_model.freezed.dart';

part 'pokemon_evolutions_model.g.dart';

@freezed
class PokemonEvolutionsModel with _$PokemonEvolutionsModel {
  factory PokemonEvolutionsModel({
    @JsonKey(name: 'first_evolution') PokemonModel? first_evolution,
    @JsonKey(name: 'second_evolution') List<PokemonModel>? second_evolution,
    @JsonKey(name: 'third_evolution') List<PokemonModel>? third_evolution,
  }) = _PokemonEvolutionsModel;

  factory PokemonEvolutionsModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonEvolutionsModelFromJson(json);
}
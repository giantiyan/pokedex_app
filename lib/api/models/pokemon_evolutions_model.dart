import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/models/pokemon_model.dart';

part 'pokemon_evolutions_model.freezed.dart';

part 'pokemon_evolutions_model.g.dart';

@freezed
class PokemonEvolutionsModel with _$PokemonEvolutionsModel {
  factory PokemonEvolutionsModel({
    @JsonKey(name: 'firstEvolution') PokemonModel? firstEvolution,
    @Default(<PokemonModel>[])
    @JsonKey(name: 'secondEvolutions')
        List<PokemonModel> secondEvolutions,
    @Default(<PokemonModel>[])
    @JsonKey(name: 'thirdEvolutions')
        List<PokemonModel> thirdEvolutions,
  }) = _PokemonEvolutionsModel;

  factory PokemonEvolutionsModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonEvolutionsModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_moves_model.freezed.dart';

part 'pokemon_moves_model.g.dart';

@freezed
class PokemonMovesModel with _$PokemonMovesModel {
  factory PokemonMovesModel({
    @JsonKey(name: 'name') List<String>? name,
  }) = _PokemonMovesModel;

  factory PokemonMovesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonMovesModelFromJson(json);
}

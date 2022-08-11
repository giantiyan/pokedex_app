import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_move_model.freezed.dart';

part 'pokemon_move_model.g.dart';

@freezed
class PokemonMoveModel with _$PokemonMoveModel {
  factory PokemonMoveModel({
    @JsonKey(name: 'name') String? name,
  }) = _PokemonMoveModel;

  factory PokemonMoveModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveModelFromJson(json);
}

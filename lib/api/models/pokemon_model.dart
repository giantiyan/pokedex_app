import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/api/models/pokemon_type_model.dart';

part 'pokemon_model.freezed.dart';
part 'pokemon_model.g.dart';

@freezed
class PokemonModel with _$PokemonModel {
  factory PokemonModel({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'id') int? id,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
}

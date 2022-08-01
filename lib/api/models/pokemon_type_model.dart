import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_type_model.freezed.dart';

part 'pokemon_type_model.g.dart';

@freezed
class PokemonTypeModel with _$PokemonTypeModel {
  factory PokemonTypeModel({
    @JsonKey(name: 'name') String? name,
  }) = _PokemonTypeModel;

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeModelFromJson(json);
}

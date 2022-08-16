import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_about_model.freezed.dart';
part 'pokemon_about_model.g.dart';

@freezed
class PokemonAboutModel with _$PokemonAboutModel {
  factory PokemonAboutModel({
    @JsonKey(name: 'height') int? height,
    @JsonKey(name: 'weight') int? weight,
    @JsonKey(name: 'abilities') List<dynamic>? abilities,
    @JsonKey(name: 'base_experience') int? baseExperience,
  }) = _PokemonAboutModel;

  factory PokemonAboutModel.fromJson(Map<String, dynamic> json) => _$PokemonAboutModelFromJson(json);
}

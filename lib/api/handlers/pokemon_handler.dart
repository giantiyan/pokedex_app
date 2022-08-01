import 'dart:convert';
import 'package:dartx/dartx.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/api/models/pokemon_type_model.dart';
import 'package:pokedex/utilities/constants.dart';

class PokemonHandler {
  static Future<List<PokemonModel>?> getPokemon() async {
    var response = http.Response('', 100);

    try {
      response = await http.get(Uri.tryParse(pokemonListURL) ?? Uri());
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['results'];

      final pokemonResults = results
          .mapIndexed((index, pokemon) => PokemonModel(
                name: pokemon['name'],
                url: pokemon['url'],
                id: index + 1,
              ))
          .toList();
      return pokemonResults;
    } else {
      return null;
    }
  }

  static Future<List<PokemonTypeModel>?> getPokemonType(int id) async {
    var response = http.Response('', 100);

    try {
      response = await http.get(Uri.tryParse('$pokemonURL/$id') ?? Uri());
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['types'];
      final typeResults = results
          .mapIndexed(
              (index, type) => PokemonTypeModel(name: type['type']['name']))
          .toList();

      return typeResults;
    } else {
      print('Can\'t get Pokemon types. Error ${response.statusCode}');
      return [];
    }
  }
}

import 'dart:convert';
import 'package:pokedex/api/models/pokemon_about_model.dart';
import 'package:pokedex/api/models/pokemon_base_stat_model.dart';
import 'package:pokedex/api/models/pokemon_evolutions_model.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/api/models/pokemon_move_model.dart';
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
      final results = jsonDecode(response.body)['results'];

      return (results as List)
          .map((pokemon) => PokemonModel.fromJson(pokemon))
          .toList();
    } else {
      return null;
    }
  }

  static Future<List<PokemonModel>?> filterPokemon(String type) async {
    var response = http.Response('', 100);

    try {
      response = await http.get(Uri.tryParse('$pokemonTypeURL/$type') ?? Uri());
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['pokemon'];

      return (results as List)
          .map((pokemon) => PokemonModel.fromJson(pokemon['pokemon']))
          .toList();
    } else {
      return null;
    }
  }

  static Future<List<PokemonTypeModel>?> getPokemonType(String url) async {
    var response = http.Response('', 100);

    try {
      response = await http.get(Uri.tryParse(url) ?? Uri());
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['types'];
      return (results as List)
          .map((type) => PokemonTypeModel.fromJson(type['type']))
          .toList();
    } else {
      print('Can\'t get Pokemon types. Error ${response.statusCode}');
      return [];
    }
  }

  static Future<PokemonAboutModel?> getPokemonAbout(String url) async {
    var response = http.Response('', 100);

    try {
      response = await http.get(Uri.tryParse(url) ?? Uri());
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);

      return PokemonAboutModel.fromJson(results);
    } else {
      return null;
    }
  }

  static Future<List<PokemonBaseStatModel>?> getPokemonBaseStats(
      String url) async {
    var response = http.Response('', 100);

    try {
      response = await http.get(Uri.tryParse(url) ?? Uri());
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['stats'];
      return (results as List)
          .map((stats) => PokemonBaseStatModel.fromJson(stats))
          .toList();
    } else {
      return null;
    }
  }

  static Future<PokemonEvolutionsModel?> getPokemonEvolutionChain(
      int id) async {
    var response = http.Response('', 100);

    try {
      response =
          await http.get(Uri.tryParse('$pokemonSpeciesURL/$id') ?? Uri());
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      var evolutionChainResults = results['evolution_chain']['url'];

      return getPokemonEvolutions(evolutionChainResults);
    } else {
      return null;
    }
  }

  static Future<PokemonEvolutionsModel?> getPokemonEvolutions(
      String url) async {
    var response = http.Response('', 100);

    try {
      response = await http.get(Uri.tryParse(url) ?? Uri());
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['chain'];
      final secondEvolutionResults = (results['evolves_to'] as List);
      final hasSecondEvolution = secondEvolutionResults.isNotEmpty;
      final hasThirdEvolution = hasSecondEvolution &&
          secondEvolutionResults.first['evolves_to'].isNotEmpty;

      var thirdEvolutionList = <PokemonModel>[];

      hasThirdEvolution
          ? secondEvolutionResults.map((pokemon) {
              List thirdEvolutionResults = pokemon['evolves_to'];

              thirdEvolutionResults
                  .map((evolution) => thirdEvolutionList
                      .add(PokemonModel.fromJson(evolution['species'])))
                  .toList();
            }).toList()
          : [];

      return PokemonEvolutionsModel(
        firstEvolution: PokemonModel.fromJson(results['species']),
        secondEvolutions: hasSecondEvolution
            ? secondEvolutionResults
                .map((pokemon) => PokemonModel.fromJson(pokemon['species']))
                .toList()
            : [],
        thirdEvolutions: thirdEvolutionList,
      );
    } else {
      return null;
    }
  }

  static Future<List<PokemonMoveModel>?> getPokemonMoves(String url) async {
    var response = http.Response('', 100);

    try {
      response = await http.get(Uri.tryParse(url) ?? Uri());
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['moves'];
      final movesResults = (results as List)
          .map((moves) => PokemonMoveModel.fromJson(moves['move']))
          .toList();

      return movesResults;
    } else {
      return null;
    }
  }
}

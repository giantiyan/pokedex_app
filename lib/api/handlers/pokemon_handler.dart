import 'dart:convert';
import 'package:dartx/dartx.dart';
import 'package:pokedex/api/models/pokemon_about_model.dart';
import 'package:pokedex/api/models/pokemon_base_stats_model.dart';
import 'package:pokedex/api/models/pokemon_evolutions_model.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/api/models/pokemon_moves_model.dart';
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

  static Future<List<PokemonModel>?> filterPokemon(String type) async {
    var response = http.Response('', 100);

    try {
      response = await http.get(Uri.tryParse('$pokemonTypeURL/$type') ?? Uri());
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['pokemon'];

      final pokemonResults = results
          .map((pokemon) => PokemonModel(
        name: pokemon['pokemon']['name'],
        url: pokemon['pokemon']['url'],
        id: int.parse(pokemon['pokemon']['url'].toString().split('/')[6]),
      ))
          .toList();
      return pokemonResults;
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

  static Future<PokemonAboutModel?> getPokemonAbout(String url) async {
    var response = http.Response('', 100);

    try {
      response = await http.get(Uri.tryParse(url) ?? Uri());
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      final List abilityResults = results['abilities'];

      return PokemonAboutModel(
        height: results['height'],
        weight: results['weight'],
        base_experience: results['base_experience'],
        abilities: abilityResults
            .map((ability) => ability['ability']['name'].toString())
            .toList(),
      );
    } else {
      return null;
    }
  }

  static Future<PokemonBaseStatsModel?> getPokemonBaseStats(String url) async {
    var response = http.Response('', 100);

    try {
      response = await http.get(Uri.tryParse(url) ?? Uri());
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      final List baseStatsResults = results['stats'];

      return PokemonBaseStatsModel(
        base_stat: baseStatsResults
            .map((base_stat) => base_stat['base_stat'].toString())
            .toList(),
        name: baseStatsResults
            .map((name) => name['stat']['name'].toString())
            .toList(),
      );
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
      final List secondEvolutionResults = results['evolves_to'];
      var hasSecondEvolution;
      var hasThirdEvolution;

      if (secondEvolutionResults.isEmpty) {
        hasSecondEvolution = false;
        hasThirdEvolution = false;
      } else {
        hasSecondEvolution = true;

        if (secondEvolutionResults.first['evolves_to'].isEmpty)
          hasThirdEvolution = false;
        else
          hasThirdEvolution = true;
      }

      var thirdEvolutionList = <PokemonModel>[];

      hasThirdEvolution
          ? secondEvolutionResults.map((pokemon) {
              List thirdEvolutionResults = pokemon['evolves_to'];

              thirdEvolutionResults.map((pokemon2) {
                thirdEvolutionList.add(PokemonModel(
                  name: pokemon2['species']['name'],
                  url: pokemon2['species']['url'],
                  id: int.parse(pokemon2['species']['url'].split('/')[6]),
                ));
              }).toList();
            }).toList()
          : [];

      return PokemonEvolutionsModel(
        firstEvolution: PokemonModel(
          name: results['species']['name'],
          url: results['species']['url'],
          id: int.parse(results['species']['url'].split('/')[6]),
        ),
        secondEvolutions: hasSecondEvolution
            ? secondEvolutionResults.map((pokemon) {
                return PokemonModel(
                  name: pokemon['species']['name'],
                  url: pokemon['species']['url'],
                  id: int.parse(pokemon['species']['url'].split('/')[6]),
                );
              }).toList()
            : [],
        thirdEvolutions: thirdEvolutionList,
      );
    } else {
      return null;
    }
  }

  static Future<PokemonMovesModel?> getPokemonMoves(String url) async {
    var response = http.Response('', 100);

    try {
      response = await http.get(Uri.tryParse(url) ?? Uri());
    } catch (e) {
      print(e);
    }

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      final List movesResults = results['moves'];

      return PokemonMovesModel(
        name: movesResults
            .map((name) => name['move']['name'].toString())
            .toList(),
      );
    } else {
      return null;
    }
  }
}

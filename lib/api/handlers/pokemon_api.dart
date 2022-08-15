import 'package:pokedex/api/api_client.dart';
import 'package:pokedex/api/models/pokemon_about_model.dart';
import 'package:pokedex/api/models/pokemon_base_stat_model.dart';
import 'package:pokedex/api/models/pokemon_evolutions_model.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/api/models/pokemon_move_model.dart';
import 'package:pokedex/api/models/pokemon_type_model.dart';

class PokemonApi {
  PokemonApi(ApiClient apiClient) : apiClient = apiClient;

  final ApiClient apiClient;

  Future<List<PokemonModel>?> getPokemon() async {
    final baseUri = Uri.parse(apiClient.baseUrl);

    final uri = baseUri.replace(
      path: baseUri.path + 'pokemon',
      query: 'limit=1154',
    );

    return await apiClient.dio.getUri(uri).then(
        (response) => (response.data['results'] as List).map((pokemon) => PokemonModel.fromJson(pokemon)).toList());
  }

  Future<List<PokemonModel>?> filterPokemon(String type) async {
    final baseUri = Uri.parse(apiClient.baseUrl);

    final uri = baseUri.replace(path: baseUri.path + 'type/$type');

    return await apiClient.dio.getUri(uri).then((response) =>
        (response.data['pokemon'] as List).map((pokemon) => PokemonModel.fromJson(pokemon['pokemon'])).toList());
  }

  Future<List<PokemonTypeModel>?> getPokemonType(int id) async {
    final baseUri = Uri.parse(apiClient.baseUrl);

    final uri = baseUri.replace(path: baseUri.path + 'pokemon/$id');

    return await apiClient.dio.getUri(uri).then(
        (response) => (response.data['types'] as List).map((type) => PokemonTypeModel.fromJson(type['type'])).toList());
  }

  Future<PokemonAboutModel?> getPokemonAbout(int id) async {
    final baseUri = Uri.parse(apiClient.baseUrl);

    final uri = baseUri.replace(path: baseUri.path + 'pokemon/$id');

    return await apiClient.dio.getUri(uri).then((response) => PokemonAboutModel.fromJson(response.data));
  }

  Future<List<PokemonBaseStatModel>?> getPokemonBaseStats(int id) async {
    final baseUri = Uri.parse(apiClient.baseUrl);

    final uri = baseUri.replace(path: baseUri.path + 'pokemon/$id');

    return await apiClient.dio.getUri(uri).then(
        (response) => (response.data['stats'] as List).map((stats) => PokemonBaseStatModel.fromJson(stats)).toList());
  }

  Future<PokemonEvolutionsModel?> getPokemonEvolutionChain(int id) async {
    final baseUri = Uri.parse(apiClient.baseUrl);

    final uri = baseUri.replace(path: baseUri.path + 'pokemon-species/$id');

    return await apiClient.dio
        .getUri(uri)
        .then((response) => getPokemonEvolutions(response.data['evolution_chain']['url']));
  }

  Future<PokemonEvolutionsModel?> getPokemonEvolutions(String url) async {
    final baseUri = Uri.parse(url);

    final uri = baseUri;

    return await apiClient.dio.getUri(uri).then((response) {
      final results = response.data['chain'];
      final secondEvolutionResults = (results['evolves_to'] as List);
      final hasSecondEvolution = secondEvolutionResults.isNotEmpty;
      final hasThirdEvolution = hasSecondEvolution && secondEvolutionResults.first['evolves_to'].isNotEmpty;

      var thirdEvolutionList = <PokemonModel>[];

      hasThirdEvolution
          ? secondEvolutionResults.map((pokemon) {
              List thirdEvolutionResults = pokemon['evolves_to'];

              thirdEvolutionResults
                  .map((evolution) => thirdEvolutionList.add(PokemonModel.fromJson(evolution['species'])))
                  .toList();
            }).toList()
          : [];

      return PokemonEvolutionsModel(
        firstEvolution: PokemonModel.fromJson(results['species']),
        secondEvolutions: hasSecondEvolution
            ? secondEvolutionResults.map((pokemon) => PokemonModel.fromJson(pokemon['species'])).toList()
            : [],
        thirdEvolutions: thirdEvolutionList,
      );
    });
  }

  Future<List<PokemonMoveModel>?> getPokemonMoves(int id) async {
    final baseUri = Uri.parse(apiClient.baseUrl);

    final uri = baseUri.replace(path: baseUri.path + 'pokemon/$id');

    return await apiClient.dio.getUri(uri).then((response) =>
        (response.data['moves'] as List).map((moves) => PokemonMoveModel.fromJson(moves['move'])).toList());
  }
}

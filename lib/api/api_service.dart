import 'package:pokedex/api/api_client.dart';
import 'package:pokedex/utilities/constants.dart';

import 'handlers/pokemon_api.dart';

class ApiService {
  PokemonApi get pokemonApi => PokemonApi(_pokemonAPIClient);

  ApiClient get _pokemonAPIClient => _createApiClient(baseUrl: baseUrl);

  ApiClient _createApiClient({required String baseUrl}) => ApiClient(baseUrl: baseUrl);
}

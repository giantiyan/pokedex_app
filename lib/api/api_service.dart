import 'package:pokedex/api/api_client.dart';
import 'package:pokedex/api/handlers/pokemon_api.dart';
import 'package:pokedex/utilities/constants.dart';


class ApiService {
  PokemonApi get pokemonApi => PokemonApi(_pokemonAPIClient);

  ApiClient get _pokemonAPIClient => _createApiClient(baseUrl: baseUrl);

  ApiClient _createApiClient({required String baseUrl}) => ApiClient(baseUrl: baseUrl);
}

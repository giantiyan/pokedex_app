import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/api/models/pokemon_type_model.dart';
import 'package:pokedex/state/app_state.dart';
import 'details_page_connector.dart';

class DetailsPageVmFactory extends VmFactory<AppState, DetailsPageConnector> {
  @override
  Vm fromStore() => DetailsPageVm(
        specificPokemon: state.specificPokemon,
        types: state.types,
      );
}

class DetailsPageVm extends Vm {
  DetailsPageVm({
    this.specificPokemon,
    this.types,
  }) : super(equals: [specificPokemon, types]);

  final PokemonModel? specificPokemon;
  final List<PokemonTypeModel>? types;
}

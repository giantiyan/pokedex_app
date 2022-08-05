import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/api/models/pokemon_type_model.dart';
import 'package:pokedex/models/union_page_state.dart';
import 'package:pokedex/state/actions/details_page_actions.dart';
import 'package:pokedex/state/app_state.dart';
import 'details_page_connector.dart';

class DetailsPageVmFactory extends VmFactory<AppState, DetailsPageConnector> {
  @override
  Vm fromStore() => DetailsPageVm(
        specificPokemon: state.specificPokemon,
        types: state.types,
        pageState: _getPageState(),
      );

  UnionPageState<List<PokemonTypeModel>?> _getPageState() {
    if (state.wait.isWaitingFor(getPokemonTypesKey)) {
      return const UnionPageState.loading();
    } else if (state.types != null) {
      return UnionPageState(state.types);
    } else {
      return const UnionPageState.error('About Tab Error Message');
    }
  }
}

class DetailsPageVm extends Vm {
  DetailsPageVm({
    this.specificPokemon,
    this.types,
    required this.pageState,
  }) : super(equals: [specificPokemon, types, pageState]);

  final PokemonModel? specificPokemon;
  final List<PokemonTypeModel>? types;
  late UnionPageState<List<PokemonTypeModel>?> pageState;
}

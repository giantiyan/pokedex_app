import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/features/home_page/home_page_connector.dart';
import 'package:pokedex/models/union_page_state.dart';
import 'package:pokedex/state/actions/home_page_actions.dart';
import 'package:pokedex/state/app_state.dart';

class HomePageVmFactory extends VmFactory<AppState, HomePageConnector> {
  @override
  Vm fromStore() => HomePageVm(
        pokemon: state.pokemon,
        pageState: _getPageState(),
      );

  UnionPageState<List<PokemonModel>?> _getPageState() {
    if (state.wait.isWaitingFor(getPokemonListKey)) {
      return const UnionPageState.loading();
    } else if (state.pokemon?.isNotEmpty == true) {
      return UnionPageState(state.pokemon);
    } else {
      return const UnionPageState.error('Home Page Error Message');
    }
  }
}

class HomePageVm extends Vm {
  HomePageVm({
    this.pokemon,
    required this.pageState,
  }) : super(equals: [pokemon, pageState]);

  final List<PokemonModel>? pokemon;
  late UnionPageState<List<PokemonModel>?> pageState;
}

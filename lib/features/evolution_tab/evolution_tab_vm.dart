import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/models/pokemon_evolutions_model.dart';
import 'package:pokedex/features/evolution_tab/evolution_tab_connector.dart';
import 'package:pokedex/models/union_page_state.dart';
import 'package:pokedex/state/actions/details_page_actions.dart';
import 'package:pokedex/state/app_state.dart';

class EvolutionTabVmFactory extends VmFactory<AppState, EvolutionTabConnector> {
  @override
  Vm? fromStore() => EvolutionTabVm(
        evolutions: state.evolutions,
        pageState: _getPageState(),
      );

  UnionPageState<PokemonEvolutionsModel?> _getPageState() {
    if (state.wait.isWaitingFor(getPokemonEvolutionKey)) {
      return const UnionPageState.loading();
    } else if (state.evolutions != null) {
      return UnionPageState(state.evolutions);
    } else {
      return const UnionPageState.error('Evolution Tab Error Message');
    }
  }
}

class EvolutionTabVm extends Vm {
  EvolutionTabVm({
    required this.pageState,
    this.evolutions,
  }) : super(equals: [evolutions, pageState]);

  final PokemonEvolutionsModel? evolutions;
  final UnionPageState<PokemonEvolutionsModel?> pageState;
}

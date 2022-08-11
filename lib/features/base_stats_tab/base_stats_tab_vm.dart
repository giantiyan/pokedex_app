import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/models/pokemon_base_stat_model.dart';
import 'package:pokedex/features/base_stats_tab/base_stats_tab_connector.dart';
import 'package:pokedex/models/union_page_state.dart';
import 'package:pokedex/state/actions/details_page_actions.dart';
import 'package:pokedex/state/app_state.dart';

class BaseStatsTabVmFactory extends VmFactory<AppState, BaseStatsTabConnector> {
  @override
  Vm? fromStore() => BaseStatsTabVm(
        baseStats: state.baseStats,
        pageState: _getPageState(),
      );

  UnionPageState<List<PokemonBaseStatModel>?> _getPageState() {
    if (state.wait.isWaitingFor(getPokemonBaseStatsKey)) {
      return const UnionPageState.loading();
    } else if (state.baseStats != null) {
      return UnionPageState(state.baseStats);
    } else {
      return const UnionPageState.error('Base Stats Tab Error Message');
    }
  }
}

class BaseStatsTabVm extends Vm {
  BaseStatsTabVm({
    required this.pageState,
    this.baseStats,
  }) : super(equals: [baseStats, pageState]);

  final List<PokemonBaseStatModel>? baseStats;
  final UnionPageState<List<PokemonBaseStatModel>?> pageState;
}

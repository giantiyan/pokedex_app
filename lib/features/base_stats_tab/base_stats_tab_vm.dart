import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/models/pokemon_base_stats_model.dart';
import 'package:pokedex/features/base_stats_tab/base_stats_tab_connector.dart';
import 'package:pokedex/models/union_page_state.dart';
import 'package:pokedex/state/actions/details_page_actions.dart';
import 'package:pokedex/state/app_state.dart';

class BaseStatsTabVmFactory extends VmFactory<AppState, BaseStatsTabConnector> {
  @override
  Vm? fromStore() => BaseStatsTabVm(
        baseStats: state.base_stats,
        pageState: _getPageState(),
      );

  UnionPageState<PokemonBaseStatsModel?> _getPageState() {
    if (state.wait.isWaitingFor(getPokemonBaseStatsKey)) {
      return const UnionPageState.loading();
    } else if (state.base_stats != null) {
      return UnionPageState(state.base_stats);
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

  final PokemonBaseStatsModel? baseStats;
  late UnionPageState<PokemonBaseStatsModel?> pageState;
}

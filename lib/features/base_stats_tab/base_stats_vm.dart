import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/models/pokemon_base_stats_model.dart';
import 'package:pokedex/features/base_stats_tab/base_stats_connector.dart';
import 'package:pokedex/state/app_state.dart';

class BaseStatsTabVmFactory extends VmFactory<AppState, BaseStatsTabConnector> {
  @override
  Vm? fromStore() => BaseStatsTabVm(baseStats: state.base_stats);
}

class BaseStatsTabVm extends Vm {
  BaseStatsTabVm({this.baseStats}) : super(equals: [baseStats]);

  final PokemonBaseStatsModel? baseStats;
}

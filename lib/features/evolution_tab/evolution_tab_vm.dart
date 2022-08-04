import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/models/pokemon_evolutions_model.dart';
import 'package:pokedex/features/evolution_tab/evolution_tab_connector.dart';
import 'package:pokedex/state/app_state.dart';

class EvolutionTabVmFactory extends VmFactory<AppState, EvolutionTabConnector> {
  @override
  Vm? fromStore() => EvolutionTabVm(evolutions: state.evolutions);
}

class EvolutionTabVm extends Vm {
  EvolutionTabVm({this.evolutions}) : super(equals: [evolutions]);

  final PokemonEvolutionsModel? evolutions;
}

import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/models/pokemon_moves_model.dart';
import 'package:pokedex/features/moves_tab/moves_tab_connector.dart';
import 'package:pokedex/state/app_state.dart';

class MovesTabVmFactory extends VmFactory<AppState, MovesTabConnector> {
  @override
  Vm fromStore() => MovesTabVm(moves: state.moves);
}

class MovesTabVm extends Vm {
  MovesTabVm({this.moves}) : super(equals: [moves]);

  final PokemonMovesModel? moves;
}

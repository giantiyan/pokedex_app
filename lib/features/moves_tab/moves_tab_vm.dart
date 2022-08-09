import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/models/pokemon_moves_model.dart';
import 'package:pokedex/features/moves_tab/moves_tab_connector.dart';
import 'package:pokedex/models/union_page_state.dart';
import 'package:pokedex/state/actions/details_page_actions.dart';
import 'package:pokedex/state/app_state.dart';

class MovesTabVmFactory extends VmFactory<AppState, MovesTabConnector> {
  @override
  Vm fromStore() => MovesTabVm(
        moves: state.moves,
        pageState: _getPageState(),
      );

  UnionPageState<PokemonMovesModel?> _getPageState() {
    if (state.wait.isWaitingFor(getPokemonMovesKey)) {
      return const UnionPageState.loading();
    } else if (state.moves != null) {
      return UnionPageState(state.moves);
    } else {
      return const UnionPageState.error('Moves Tab Error Message');
    }
  }
}

class MovesTabVm extends Vm {
  MovesTabVm({
    required this.pageState,
    this.moves,
  }) : super(equals: [moves, pageState]);

  final PokemonMovesModel? moves;
  final UnionPageState<PokemonMovesModel?> pageState;
}

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/moves_tab/moves_tab.dart';
import 'package:pokedex/features/moves_tab/moves_tab_vm.dart';
import 'package:pokedex/state/actions/details_page_actions.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utilities/constants.dart';

class MovesTabConnector extends StatelessWidget {
  const MovesTabConnector({
    this.pokemonURL,
    this.pokemonType,
  });

  final String? pokemonURL;
  final String? pokemonType;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MovesTabVm>(
      vm: () => MovesTabVmFactory(),
      onInit: (vm) => vm.dispatch(GetPokemonMovesAction(pokemonURL)),
      builder: (context, vm) => vm.pageState.when(
        (moves) => MovesTab(
          moves: moves,
          pokemonType: pokemonType,
        ),
        loading: () => spinKitDualRing,
        error: (error) => Center(child: Text(error!)),
      ),
    );
  }
}

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/evolution_tab/evolution_tab.dart';
import 'package:pokedex/features/evolution_tab/evolution_tab_vm.dart';
import 'package:pokedex/state/actions/details_page_actions.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utilities/constants.dart';

class EvolutionTabConnector extends StatelessWidget {
  const EvolutionTabConnector(this.pokemonId);

  final int? pokemonId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, EvolutionTabVm>(
      vm: () => EvolutionTabVmFactory(),
      onInit: (vm) => vm.dispatch(GetPokemonEvolutionChainAction(pokemonId)),
      builder: (context, vm) => vm.pageState.when(
        (evolutions) => EvolutionTab(evolutions: evolutions),
        loading: () => spinKitDualRing,
        error: (error) => Center(child: Text(error!)),
      ),
    );
  }
}

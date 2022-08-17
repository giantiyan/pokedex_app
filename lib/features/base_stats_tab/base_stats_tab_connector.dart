import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/base_stats_tab/base_stats_tab.dart';
import 'package:pokedex/features/base_stats_tab/base_stats_tab_vm.dart';
import 'package:pokedex/state/actions/details_page_actions.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utilities/constants.dart';

class BaseStatsTabConnector extends StatelessWidget {
  const BaseStatsTabConnector({
    this.pokemonId,
    this.pokemonType,
  });

  final int? pokemonId;
  final String? pokemonType;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BaseStatsTabVm>(
      vm: () => BaseStatsTabVmFactory(),
      onInit: (vm) => vm.dispatch(GetPokemonBaseStatsAction(pokemonId)),
      builder: (context, vm) => vm.pageState.when(
        (baseStats) => BaseStatsTab(
          baseStats: baseStats,
          pokemonType: pokemonType,
        ),
        loading: () => spinKitDualRing,
        error: (error) => Center(child: Text(error!)),
      ),
    );
  }
}

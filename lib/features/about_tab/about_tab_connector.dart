import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/about_tab/about_tab.dart';
import 'package:pokedex/features/about_tab/about_tab_vm.dart';
import 'package:pokedex/state/actions/details_page_actions.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utilities/constants.dart';

class AboutTabConnector extends StatelessWidget {
  const AboutTabConnector(this.pokemonId);

  final int? pokemonId;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AboutTabVm>(
      vm: () => AboutTabVmFactory(),
      onInit: (vm) => vm.dispatch(GetPokemonAboutAction(pokemonId)),
      builder: (context, vm) => vm.pageState.when(
        (about) => AboutTab(about),
        loading: () => spinKitDualRing,
        error: (error) => Center(child: Text(error!)),
      ),
    );
  }
}

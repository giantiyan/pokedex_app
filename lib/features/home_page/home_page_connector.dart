import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/home_page/home_page.dart';
import 'package:pokedex/state/actions/home_page_actions.dart';
import 'package:pokedex/state/app_state.dart';

import 'home_page_vm.dart';

class HomePageConnector extends StatelessWidget {
  const HomePageConnector();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageVm>(
        vm: () => HomePageVmFactory(),
        onInit: (store) async => store.dispatch(GetPokemonAction()),
        builder: (context, vm) {
          return HomePage(pokemon: vm.pokemon);
        });
  }
}

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/home_page/home_page.dart';
import 'package:pokedex/features/home_page/home_page_vm.dart';
import 'package:pokedex/state/actions/home_page_actions.dart';
import 'package:pokedex/state/app_state.dart';

class HomePageConnector extends StatelessWidget {
  const HomePageConnector();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageVm>(
      vm: () => HomePageVmFactory(),
      onInit: (store) async => store.dispatch(GetPokemonAction()),
      builder: (context, vm) => vm.pageState.when(
        (pokemon) => HomePage(pokemon: pokemon),
        loading: () =>
            Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error) => Center(child: Text(error!)),
      ),
    );
  }
}

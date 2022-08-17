import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/home_page/home_page.dart';
import 'package:pokedex/features/home_page/home_page_vm.dart';
import 'package:pokedex/state/actions/home_page_actions.dart';
import 'package:pokedex/state/app_state.dart';

class HomePageConnector extends StatelessWidget {
  const HomePageConnector();

  static const String route = 'home-page-connector';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageVm>(
      vm: () => HomePageVmFactory(),
      onInit: (store) async => store.dispatch(GetPokemonAction()),
      builder: (context, vm) => vm.pageState.when(
        (pokemon) => HomePage(
          onSearch: vm.onSearch,
          onFilter: vm.onFilter,
          onCancel: vm.onCancel,
          pokemon: pokemon,
          isFilterButtonVisible: vm.isFilterButtonVisible,
        ),
        loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error) => Center(child: Text(error!)),
      ),
    );
  }
}

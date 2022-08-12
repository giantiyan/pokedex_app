import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/features/details_page/details_page.dart';
import 'package:pokedex/features/details_page/details_page_vm.dart';
import 'package:pokedex/state/actions/details_page_actions.dart';
import 'package:pokedex/state/app_state.dart';

class DetailsPageConnector extends StatelessWidget {
  const DetailsPageConnector(this.specificPokemon);

  final PokemonModel? specificPokemon;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DetailsPageVm>(
      vm: () => DetailsPageVmFactory(),
      onInit: (store) async => store.dispatch(GetPokemonTypesAction(specificPokemon?.url)),
      builder: (context, vm) => vm.pageState.when(
        (types) => DetailsPage(specificPokemon: specificPokemon, types: types),
        loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error) => Center(child: Text(error!)),
      ),
    );
  }
}

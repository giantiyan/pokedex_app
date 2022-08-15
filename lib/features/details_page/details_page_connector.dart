import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/features/details_page/details_page.dart';
import 'package:pokedex/features/details_page/details_page_vm.dart';
import 'package:pokedex/state/actions/details_page_actions.dart';
import 'package:pokedex/state/app_state.dart';

class DetailsPageConnectorArgs {
  const DetailsPageConnectorArgs({this.specificPokemon});

  final PokemonModel? specificPokemon;
}

class DetailsPageConnector extends StatelessWidget {
  const DetailsPageConnector({required this.args});

  static const String route = 'details-page-connector';

  final DetailsPageConnectorArgs args;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DetailsPageVm>(
      vm: () => DetailsPageVmFactory(),
      onInit: (store) async => store.dispatch(GetPokemonTypesAction(args.specificPokemon?.url)),
      builder: (context, vm) => vm.pageState.when(
        (types) => DetailsPage(
          specificPokemon: args.specificPokemon,
          types: types,
        ),
        loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error) => Center(child: Text(error!)),
      ),
    );
  }
}

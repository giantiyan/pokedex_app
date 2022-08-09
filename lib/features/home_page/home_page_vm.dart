import 'package:async_redux/async_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/features/home_page/home_page_connector.dart';
import 'package:pokedex/models/union_page_state.dart';
import 'package:pokedex/state/actions/home_page_actions.dart';
import 'package:pokedex/state/app_state.dart';

class HomePageVmFactory extends VmFactory<AppState, HomePageConnector> {
  @override
  Vm fromStore() => HomePageVm(
        onFilter: _onFilterPokemons,
        onCancel: _onCancelFilter,
        pokemon: state.pokemon,
        isVisible: state.isVisible,
        pageState: _getPageState(),
      );

  UnionPageState<List<PokemonModel>?> _getPageState() {
    if (state.wait.isWaitingFor(getPokemonListKey)) {
      return const UnionPageState.loading();
    } else if (state.pokemon?.isNotEmpty == true) {
      return UnionPageState(state.pokemon);
    } else {
      return const UnionPageState.error('Home Page Error Message');
    }
  }

  void _onFilterPokemons(type) => dispatch(FilterPokemonAction(type));

  void _onCancelFilter() => dispatch(GetPokemonAction());
}

class HomePageVm extends Vm {
  HomePageVm({
    required this.onFilter,
    required this.onCancel,
    required this.pageState,
    this.pokemon,
    this.isVisible,
  }) : super(equals: [pokemon, pageState]);

  final Function(String? typeName) onFilter;
  final VoidCallback onCancel;
  final List<PokemonModel>? pokemon;
  final bool? isVisible;
  late UnionPageState<List<PokemonModel>?> pageState;
}

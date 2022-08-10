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
        onSearch: _onSearchPokemons,
        onFilter: _onFilterPokemons,
        onCancel: _onCancelFilter,
        isVisible: state.isVisible,
        pageState: _getPageState(),
      );

  UnionPageState<List<PokemonModel>?> _getPageState() {
    if (state.wait.isWaitingFor(getPokemonListKey)) {
      return const UnionPageState.loading();
    } else if (state.searchedPokemon?.isNotEmpty == true) {
      return UnionPageState(state.searchedPokemon);
    } else if (state.pokemon?.isNotEmpty == true) {
      return UnionPageState(state.pokemon);
    } else {
      return const UnionPageState.error('Home Page Error Message');
    }
  }

  void _onSearchPokemons(query) {
    var searchedPokemon = state.pokemon
        ?.where((pokemon) =>
            pokemon.name!
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            pokemon.id!.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();

    dispatch(SearchPokemonAction(searchedPokemon));
  }

  void _onFilterPokemons(type) => dispatch(FilterPokemonAction(type));

  void _onCancelFilter() => dispatch(GetPokemonAction());
}

class HomePageVm extends Vm {
  HomePageVm({
    required this.onSearch,
    required this.onFilter,
    required this.onCancel,
    required this.pageState,
    this.isVisible,
  }) : super(equals: [pageState]);

  final Function(String? query) onSearch;
  final Function(String? typeName) onFilter;
  final VoidCallback onCancel;
  final bool? isVisible;
  final UnionPageState<List<PokemonModel>?> pageState;
}

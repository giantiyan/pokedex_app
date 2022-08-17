import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/models/pokemon_about_model.dart';
import 'package:pokedex/features/about_tab/about_tab_connector.dart';
import 'package:pokedex/models/union_page_state.dart';
import 'package:pokedex/state/actions/details_page_actions.dart';
import 'package:pokedex/state/app_state.dart';

class AboutTabVmFactory extends VmFactory<AppState, AboutTabConnector> {
  @override
  Vm fromStore() => AboutTabVm(
        about: state.about,
        pageState: _getPageState(),
      );

  UnionPageState<PokemonAboutModel?> _getPageState() {
    if (state.wait.isWaitingFor(getPokemonAboutKey)) {
      return const UnionPageState.loading();
    } else if (state.about != null) {
      return UnionPageState(state.about);
    } else {
      return const UnionPageState.error('About Tab Error Message');
    }
  }
}

class AboutTabVm extends Vm {
  AboutTabVm({
    required this.pageState,
    this.about,
  }) : super(equals: [about, pageState]);

  final PokemonAboutModel? about;
  final UnionPageState<PokemonAboutModel?> pageState;
}

import 'package:async_redux/async_redux.dart';
import 'package:pokedex/api/models/pokemon_about_model.dart';
import 'package:pokedex/features/about_tab/about_tab_connector.dart';
import 'package:pokedex/state/app_state.dart';

class AboutTabVmFactory extends VmFactory<AppState, AboutTabConnector> {
  @override
  Vm fromStore() => AboutTabVm(about: state.about);
}

class AboutTabVm extends Vm {
  AboutTabVm({this.about}) : super(equals: [about]);

  final PokemonAboutModel? about;
}

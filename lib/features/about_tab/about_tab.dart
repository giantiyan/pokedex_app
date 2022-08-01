import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_about_model.dart';
import 'package:pokedex/features/about_tab/widgets/about_information.dart';
import 'package:pokedex/utilities/extensions.dart';
import 'package:pokedex/utilities/string_constants.dart';

class AboutTab extends StatelessWidget {
  const AboutTab(this.about);

  final PokemonAboutModel? about;

  @override
  Widget build(BuildContext context) {
    return (about != null) ?
    Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AboutInformation(height, about?.height.toString().toHeight),
            AboutInformation(weight, about?.weight.toString().toWeight),
            AboutInformation(abilities, about?.abilities?.toString().replaceBracket.replaceDash.toTitleCase),
            AboutInformation(baseExperience, about?.base_experience.toString().toBaseExp),
          ],
        ),
      ),
    ) : Center(child: CircularProgressIndicator());
  }
}

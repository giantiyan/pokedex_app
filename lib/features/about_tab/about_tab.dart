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
    return (about != null)
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AboutInformation(
                    label: height,
                    value: about?.height.toString().toHeight,
                  ),
                  AboutInformation(
                    label: weight,
                    value: about?.weight.toString().toWeight,
                  ),
                  AboutInformation(
                    label: abilities,
                    value: about?.abilities
                        ?.map((abilities) =>
                            abilities['ability']['name'].toString())
                        .toList()
                        .capitalizedAbilities,
                  ),
                  AboutInformation(
                    label: baseExperience,
                    value: about?.base_experience.toString().toBaseExp,
                  ),
                ],
              ),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}

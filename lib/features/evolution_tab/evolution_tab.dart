import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_evolutions_model.dart';
import 'package:pokedex/utilities/extensions.dart';

class EvolutionTab extends StatelessWidget {
  const EvolutionTab({this.evolutions});

  final PokemonEvolutionsModel? evolutions;

  @override
  Widget build(BuildContext context) {
    return (evolutions != null)
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.network(evolutions?.first_evolution?.id
                                .toString()
                                .pokemonImage ??
                            '', ),
                        Text(evolutions?.first_evolution?.name
                                .toString()
                                .replaceDash
                                .toTitleCase ??
                            '')
                      ],
                    ),
                  ),
                ),

                if ((evolutions?.second_evolution?.length ?? 0) > 0)
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: evolutions?.second_evolution?.length,
                      itemBuilder: (context, index) => Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(
                              IconData(0xe09c,
                                  fontFamily: 'MaterialIcons',
                                  matchTextDirection: true),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.network(evolutions
                                        ?.second_evolution?[index].id
                                        .toString()
                                        .pokemonImage ??
                                    ''),
                                Text(evolutions?.second_evolution?[index].name
                                        .toString()
                                        .replaceDash
                                        .toTitleCase ??
                                    ''),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                if ((evolutions?.third_evolution?.length ?? 0) > 0)
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: evolutions?.third_evolution?.length,
                      itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(
                              IconData(0xe09c,
                                  fontFamily: 'MaterialIcons',
                                  matchTextDirection: true),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.network(evolutions
                                        ?.third_evolution?[index].id
                                        .toString()
                                        .pokemonImage ??
                                    ''),
                                Text(evolutions?.third_evolution?[index].name
                                        .toString()
                                        .replaceDash
                                        .toTitleCase ??
                                    ''),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
        )
        : Center(child: CircularProgressIndicator());
  }
}

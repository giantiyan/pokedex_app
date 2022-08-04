import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_evolutions_model.dart';
import 'package:pokedex/features/evolution_tab/widgets/evolutions_list_tile.dart';
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
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          ((evolutions?.third_evolution.length ?? 0) > 0)
                              ? Image.network(
                                  evolutions?.first_evolution?.id
                                          .toString()
                                          .pokemonImage ??
                                      '',
                                  height: 100,
                                )
                              : ((evolutions?.second_evolution.length ?? 0) > 0)
                                  ? Image.network(
                                      evolutions?.first_evolution?.id
                                              .toString()
                                              .pokemonImage ??
                                          '',
                                      height: 150,
                                    )
                                  : Image.network(
                                      evolutions?.first_evolution?.id
                                              .toString()
                                              .pokemonImage ??
                                          '',
                                      height: 175,
                                    ),
                          Text(
                              evolutions?.first_evolution?.name
                                      .toString()
                                      .replaceDash
                                      .toTitleCase ??
                                  '',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          Text(evolutions?.first_evolution?.id
                                  .toString()
                                  .formatID ??
                              ''),
                        ],
                      ),
                    ],
                  ),
                ),
                if ((evolutions?.second_evolution.length ?? 0) > 0)
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: evolutions?.second_evolution.length,
                      itemBuilder: (context, index) => EvolutionsListTile(
                        pokemon: evolutions?.second_evolution[index],
                        secondEvolutionLength:
                            evolutions?.second_evolution.length,
                        thirdEvolutionLength:
                            evolutions?.third_evolution.length,
                      ),
                    ),
                  ),
                if ((evolutions?.third_evolution.length ?? 0) > 0)
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: evolutions?.third_evolution.length,
                      itemBuilder: (context, index) => EvolutionsListTile(
                        pokemon: evolutions?.third_evolution[index],
                        secondEvolutionLength:
                            evolutions?.second_evolution.length,
                        thirdEvolutionLength:
                            evolutions?.third_evolution.length,
                      ),
                    ),
                  ),
              ],
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_evolutions_model.dart';
import 'package:pokedex/features/evolution_tab/widgets/evolution_tile.dart';

class EvolutionTab extends StatelessWidget {
  const EvolutionTab({this.evolutions});

  final PokemonEvolutionsModel? evolutions;

  @override
  Widget build(BuildContext context) {
    return (evolutions != null)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      EvolutionTile(
                        name: evolutions?.firstEvolution?.name,
                        id: evolutions?.firstEvolution?.id,
                        isNotFirstEvolution: false,
                      )
                    ],
                  ),
                ),
                if (evolutions?.secondEvolutions.isNotEmpty ?? false)
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(children: [
                      ...?evolutions?.secondEvolutions
                          .map((pokemon) => EvolutionTile(
                                name: pokemon.name,
                                id: pokemon.id,
                                isNotFirstEvolution: true,
                              ))
                    ]),
                  ),
                if (evolutions?.thirdEvolutions.isNotEmpty ?? false)
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(children: [
                      ...?evolutions?.thirdEvolutions
                          .map((pokemon) => EvolutionTile(
                                name: pokemon.name,
                                id: pokemon.id,
                                isNotFirstEvolution: true,
                              ))
                    ]),
                  ),
              ],
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}

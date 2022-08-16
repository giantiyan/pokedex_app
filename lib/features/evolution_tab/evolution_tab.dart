import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_evolutions_model.dart';
import 'package:pokedex/features/evolution_tab/widgets/evolution_column.dart';
import 'package:pokedex/features/evolution_tab/widgets/evolution_tile.dart';
import 'package:pokedex/utilities/extensions.dart';

class EvolutionTab extends StatelessWidget {
  const EvolutionTab({this.evolutions});

  final PokemonEvolutionsModel? evolutions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EvolutionTile(
              name: evolutions?.firstEvolution?.name,
              id: evolutions?.firstEvolution?.url?.pokemonId,
              isNotFirstEvolution: false,
            ),
          ],
        ),
        if (evolutions?.secondEvolutions.isNotEmpty == true)
          EvolutionColumn(evolutionsList: evolutions?.secondEvolutions),
        if (evolutions?.thirdEvolutions.isNotEmpty == true)
          EvolutionColumn(evolutionsList: evolutions?.thirdEvolutions),
      ],
    );
  }
}

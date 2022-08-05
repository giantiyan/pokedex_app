import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_evolutions_model.dart';
import 'package:pokedex/features/evolution_tab/widgets/evolution_column.dart';
import 'package:pokedex/features/evolution_tab/widgets/evolution_tile.dart';

class EvolutionTab extends StatelessWidget {
  const EvolutionTab({this.evolutions});

  final PokemonEvolutionsModel? evolutions;

  @override
  Widget build(BuildContext context) {
    return (evolutions != null)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EvolutionTile(
                    name: evolutions?.firstEvolution?.name,
                    id: evolutions?.firstEvolution?.id,
                    isNotFirstEvolution: false,
                  ),
                ],
              ),
              if (evolutions?.secondEvolutions.isNotEmpty ?? false)
                EvolutionColumn(evolutionsList: evolutions?.secondEvolutions),
              if (evolutions?.thirdEvolutions.isNotEmpty ?? false)
                EvolutionColumn(evolutionsList: evolutions?.thirdEvolutions),
            ],
          )
        : Center(child: CircularProgressIndicator());
  }
}

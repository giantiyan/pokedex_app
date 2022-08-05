import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_evolutions_model.dart';
import 'package:pokedex/features/evolution_tab/widgets/evolution_column.dart';

class EvolutionTab extends StatelessWidget {
  const EvolutionTab({this.evolutions});

  final PokemonEvolutionsModel? evolutions;

  @override
  Widget build(BuildContext context) {
    return (evolutions != null)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EvolutionColumn(
                firstEvolution: evolutions?.firstEvolution,
                isNotFirstEvolution: false,
              ),
              if (evolutions?.secondEvolutions.isNotEmpty ?? false)
                EvolutionColumn(
                  evolutionsList: evolutions?.secondEvolutions,
                  isNotFirstEvolution: true,
                ),
              if (evolutions?.thirdEvolutions.isNotEmpty ?? false)
                EvolutionColumn(
                  evolutionsList: evolutions?.thirdEvolutions,
                  isNotFirstEvolution: true,
                ),
            ],
          )
        : Center(child: CircularProgressIndicator());
  }
}

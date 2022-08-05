import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/features/evolution_tab/widgets/evolution_tile.dart';

class EvolutionColumn extends StatelessWidget {
  const EvolutionColumn(
      {this.firstEvolution, this.evolutionsList, this.isNotFirstEvolution});

  final PokemonModel? firstEvolution;
  final List<PokemonModel>? evolutionsList;
  final bool? isNotFirstEvolution;

  @override
  Widget build(BuildContext context) {
    return (isNotFirstEvolution ?? false)
        ? SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              ...?evolutionsList?.map((pokemon) => EvolutionTile(
                    name: pokemon.name,
                    id: pokemon.id,
                    isNotFirstEvolution: isNotFirstEvolution,
                  ))
            ]),
          )
        : SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                EvolutionTile(
                  name: firstEvolution?.name,
                  id: firstEvolution?.id,
                  isNotFirstEvolution: isNotFirstEvolution,
                ),
              ],
            ),
          );
  }
}

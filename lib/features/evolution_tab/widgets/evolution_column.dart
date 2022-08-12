import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/features/evolution_tab/widgets/evolution_tile.dart';
import 'package:pokedex/utilities/extensions.dart';

class EvolutionColumn extends StatelessWidget {
  const EvolutionColumn({this.evolutionsList});

  final List<PokemonModel>? evolutionsList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(children: [
        ...?evolutionsList?.map((pokemon) => EvolutionTile(
              name: pokemon.name,
              id: pokemon.url?.pokemonId,
              isNotFirstEvolution: true,
            ))
      ]),
    );
  }
}

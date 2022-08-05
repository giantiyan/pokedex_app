import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_moves_model.dart';
import 'package:pokedex/features/home_page/widgets/type.dart';
import 'package:pokedex/utilities/extensions.dart';

class MovesTab extends StatelessWidget {
  const MovesTab({
    this.moves,
    this.pokemonType,
  });

  final PokemonMovesModel? moves;
  final String? pokemonType;

  @override
  Widget build(BuildContext context) {
    return (moves != null)
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                children: moves?.name
                        ?.map((name) => Type(
                              typeName: name.replaceDash.toTitleCase,
                              pokemonType: pokemonType,
                            ))
                        .toList() ??
                    [],
              ),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}

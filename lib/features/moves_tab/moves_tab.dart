import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_move_model.dart';
import 'package:pokedex/features/home_page/widgets/type.dart';
import 'package:pokedex/utilities/extensions.dart';

class MovesTab extends StatelessWidget {
  const MovesTab({
    this.moves,
    this.pokemonType,
  });

  final List<PokemonMoveModel>? moves;
  final String? pokemonType;

  @override
  Widget build(BuildContext context) {
    return (moves != null)
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                children: moves
                        ?.map((moves) => Type(
                              typeName: moves.name?.replaceDash.toTitleCase,
                              color: pokemonType?.pokemonColor,
                            ))
                        .toList() ??
                    [],
              ),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}

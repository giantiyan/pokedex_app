import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/utilities/extensions.dart';

class EvolutionsListTile extends StatelessWidget {
  const EvolutionsListTile({this.pokemon, this.secondEvolutionLength, this.thirdEvolutionLength});

  final PokemonModel? pokemon;
  final int? secondEvolutionLength;
  final int? thirdEvolutionLength;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              ((thirdEvolutionLength ?? 0) > 0)
                  ? Image.network(
                pokemon?.id
                    .toString()
                    .pokemonImage ??
                    '',
                height: 100,
              )
                  : ((secondEvolutionLength ?? 0) > 0)
                  ? Image.network(
                pokemon?.id
                    .toString()
                    .pokemonImage ??
                    '',
                height: 150,
              )
                  : Image.network(
                pokemon?.id
                    .toString()
                    .pokemonImage ??
                    '',
                height: 175,
              ),
              Text(
                  pokemon?.name
                      .toString()
                      .replaceDash
                      .toTitleCase ??
                      '',
                  style:
                  TextStyle(fontWeight: FontWeight.w500)),
              Text(pokemon?.id
                  .toString()
                  .formatID ??
                  ''),
            ],
          ),
        ),
      ],
    );
  }
}

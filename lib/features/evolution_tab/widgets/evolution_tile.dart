import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/utilities/constants.dart';
import 'package:pokedex/utilities/extensions.dart';

class EvolutionTile extends StatelessWidget {
  const EvolutionTile({
    this.name,
    this.id,
    this.isNotFirstEvolution,
  });

  final String? name;
  final int? id;
  final bool? isNotFirstEvolution;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        if (isNotFirstEvolution == true)
          Padding(
            padding: EdgeInsets.all(2),
            child: Icon(Icons.arrow_forward_ios_rounded),
          ),
        Column(
          children: [
            CachedNetworkImage(
              imageUrl: id?.pokemonImage ?? '',
              height: evolutionPokemonHeight,
              width: evolutionPokemonWidth,
              placeholder: (context, url) => spinKitRipple,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Text(
              name?.replaceDash.toTitleCase ?? '',
              style: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              id?.formatId ?? '',
              style: textTheme.subtitle1,
            ),
          ],
        ),
      ],
    );
  }
}

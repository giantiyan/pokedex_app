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
    return Row(
      children: [
        if (isNotFirstEvolution ?? false)
          (Padding(
            padding: EdgeInsets.all(2),
            child: Icon(
              IconData(
                0xe09c,
                fontFamily: 'MaterialIcons',
                matchTextDirection: true,
              ),
            ),
          )),
        Column(
          children: [
            Image.network(
              id?.toString().pokemonImage ?? '',
              height: 100,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: spinKitRipple);
              },
            ),
            Text(name?.toString().replaceDash.toTitleCase ?? '',
                style: TextStyle(fontWeight: FontWeight.w500)),
            Text(id?.toString().formatID ?? ''),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex/utilities/colors.dart';
import 'package:pokedex/utilities/extensions.dart';

class Type extends StatelessWidget {
  const Type({
    this.typeName,
    this.pokemonType,
  });

  final String? typeName;
  final String? pokemonType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: pokemonType != null
            ? pokemonType.toString().pokemonColor
            : white.withOpacity(0.25),
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.only(
        bottom: 8,
        right: 4,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 6,
        ),
        child: Text(
          typeName?.toTitleCase ?? '',
          style: TextStyle(color: white),
        ),
      ),
    );
  }
}

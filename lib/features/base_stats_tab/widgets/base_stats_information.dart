import 'package:flutter/material.dart';
import 'package:pokedex/utilities/colors.dart';
import 'package:pokedex/utilities/extensions.dart';

class BaseStatsInformation extends StatelessWidget {
  const BaseStatsInformation({this.label, this.value, this.pokemonType});

  final String? label;
  final int? value;
  final String? pokemonType;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label ?? '',
              style: textTheme.labelMedium,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '$value',
              style: textTheme.bodyText1,
            ),
          ),
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: value! / 255,
                valueColor: new AlwaysStoppedAnimation<Color>(pokemonType!.pokemonColor),
                backgroundColor: lightGrey,
                minHeight: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

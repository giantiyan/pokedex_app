import 'package:flutter/material.dart';
import 'package:pokedex/utilities/colors.dart';
import 'package:pokedex/utilities/extensions.dart';

class BaseStatsInformation extends StatelessWidget {
  const BaseStatsInformation({this.label, this.value, this.pokemonType});

  final String? label;
  final String? value;
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
              value ?? '',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: double?.parse(value ?? '0') / 200,
                valueColor: new AlwaysStoppedAnimation<Color>(pokemonType.toString().pokemonColor),
                backgroundColor: Colors.grey[200],
                minHeight: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

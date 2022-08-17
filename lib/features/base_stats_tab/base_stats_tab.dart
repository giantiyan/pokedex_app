import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_base_stat_model.dart';
import 'package:pokedex/features/base_stats_tab/widgets/base_stats_information.dart';
import 'package:pokedex/utilities/string_constants.dart';

class BaseStatsTab extends StatelessWidget {
  BaseStatsTab({
    this.baseStats,
    this.pokemonType,
  });

  final List<PokemonBaseStatModel>? baseStats;
  final String? pokemonType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...?baseStats?.mapIndexed(
              (index, stat) => BaseStatsInformation(
                label: statName[index],
                value: stat.baseStat,
                pokemonType: pokemonType,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_base_stats_model.dart';
import 'package:pokedex/features/base_stats_tab/widgets/base_stats_information.dart';
import 'package:pokedex/utilities/extensions.dart';

class BaseStatsTab extends StatelessWidget {
  BaseStatsTab(this.baseStats);

  final PokemonBaseStatsModel? baseStats;

  @override
  Widget build(BuildContext context) {
    return (baseStats != null)
        ? Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseStatsInformation(
              label: baseStats?.name?[0].toString().toUpperCase(),
              value: baseStats?.base_stat?[0].toString(),
            ),
            BaseStatsInformation(
              label: baseStats?.name?[1].toString().capitalize,
              value: baseStats?.base_stat?[1].toString(),
            ),
            BaseStatsInformation(
              label: baseStats?.name?[2].toString().capitalize,
              value: baseStats?.base_stat?[2].toString(),
            ),
            BaseStatsInformation(
              label: baseStats?.name?[3].toString().capitalize.shortcut,
              value: baseStats?.base_stat?[3].toString(),
            ),
            BaseStatsInformation(
              label: baseStats?.name?[4].toString().capitalize.shortcut,
              value: baseStats?.base_stat?[4].toString(),
            ),
            BaseStatsInformation(
              label: baseStats?.name?[5].toString().capitalize,
              value: baseStats?.base_stat?[5].toString(),
            ),
          ],
        ),
      ),
    )
        : Center(child: CircularProgressIndicator());
  }
}

import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_base_stats_model.dart';
import 'package:pokedex/features/base_stats_tab/widgets/base_stats_information.dart';
import 'package:pokedex/utilities/extensions.dart';

class BaseStatsTab extends StatelessWidget {
  BaseStatsTab({
    this.baseStats,
    this.pokemonType,
  });

  final PokemonBaseStatsModel? baseStats;
  final String? pokemonType;

  @override
  Widget build(BuildContext context) {
    var statNameList =
        baseStats?.name?.map((name) => name.toString()).toList() ?? [];

    return (baseStats != null)
        ? Scrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...?baseStats?.base_stat?.mapIndexed(
                        (index, base_stat) => BaseStatsInformation(
                          label: statNameList[index].baseStatLabel,
                          value: base_stat.toString(),
                          pokemonType: pokemonType,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}

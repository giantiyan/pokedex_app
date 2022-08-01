import 'package:flutter/material.dart';

import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/api/models/pokemon_type_model.dart';
import 'package:pokedex/features/about_tab/about_tab_connector.dart';
import 'package:pokedex/features/base_stats_tab/base_stats_connector.dart';
import 'package:pokedex/features/home_page/widgets/type.dart';
import 'package:pokedex/utilities/extensions.dart';
import 'package:pokedex/utilities/string_constants.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    this.specificPokemon,
    this.types,
  });

  final PokemonModel? specificPokemon;
  final List<PokemonTypeModel>? types;

  @override
  Widget build(BuildContext context) {
    return (types != null)
        ? Scaffold(
      backgroundColor: types?.first.name.toString().pokemonColor,
      appBar: AppBar(backgroundColor: Colors.red),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (specificPokemon?.name).toString().capitalize,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        (specificPokemon?.id).toString().formatID,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ...?types?.map((type) => Type(type.name))
                      ],
                    ),
                    Center(
                      child: Container(
                        height: 210,
                        margin: EdgeInsets.only(bottom: 20),
                        child: Image.network(
                            specificPokemon?.id.toString().pokemonImage ??
                                ''),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26.withOpacity(0.2),
                      blurRadius: 5.0,
                      spreadRadius: 0.10,
                    )
                  ],
                ),
                child: DefaultTabController(
                  length: 4,
                  initialIndex: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TabBar(
                        indicatorColor: Colors.red,
                        labelColor: Colors.black,
                        labelPadding:
                        EdgeInsets.symmetric(horizontal: 10.0),
                        tabs: [
                          Tab(text: about),
                          Tab(text: baseStats),
                          Tab(text: evolution),
                          Tab(text: moves),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            AboutTabConnector(specificPokemon?.url),
                            BaseStatsTabConnector(specificPokemon?.url),
                            Container(child: Text('TODO 3')),
                            Container(child: Text('TODO 4')),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
        : Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

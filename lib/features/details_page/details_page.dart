import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/api/models/pokemon_type_model.dart';
import 'package:pokedex/features/about_tab/about_tab_connector.dart';
import 'package:pokedex/features/base_stats_tab/base_stats_tab_connector.dart';
import 'package:pokedex/features/evolution_tab/evolution_tab_connector.dart';
import 'package:pokedex/features/home_page/widgets/type.dart';
import 'package:pokedex/features/moves_tab/moves_tab_connector.dart';
import 'package:pokedex/utilities/colors.dart';
import 'package:pokedex/utilities/constants.dart';
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
            appBar: AppBar(backgroundColor: red),
            body: Center(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (specificPokemon?.name)
                                .toString()
                                .replaceDash
                                .toTitleCase,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              specificPokemon?.url?.pokemonId
                                      .toString()
                                      .formatID ??
                                  '',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              ...?types
                                  ?.map((type) => Type(typeName: type.name))
                            ],
                          ),
                          Center(
                            child: CachedNetworkImage(
                              imageUrl: specificPokemon?.url?.pokemonId
                                      .toString()
                                      .pokemonImage ??
                                  '',
                              height: 210,
                              placeholder: (context, url) => spinKitRipple,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      )),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
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
                              indicatorColor: red,
                              labelColor: black,
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
                                  BaseStatsTabConnector(
                                    pokemonURL: specificPokemon?.url,
                                    pokemonType: types?.first.name,
                                  ),
                                  EvolutionTabConnector(
                                      specificPokemon?.url?.pokemonId),
                                  MovesTabConnector(
                                    pokemonURL: specificPokemon?.url,
                                    pokemonType: types?.first.name,
                                  ),
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

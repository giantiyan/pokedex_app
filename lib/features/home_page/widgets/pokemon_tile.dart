import 'package:flutter/material.dart';
import 'package:pokedex/api/handlers/pokemon_handler.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/api/models/pokemon_type_model.dart';
import 'package:pokedex/features/home_page/widgets/type.dart';
import 'package:pokedex/utilities/constants.dart';
import 'package:pokedex/utilities/extensions.dart';

class PokemonTile extends StatefulWidget {
  const PokemonTile({this.pokemon});

  final PokemonModel? pokemon;

  @override
  State<PokemonTile> createState() => _PokemonTileState();
}

class _PokemonTileState extends State<PokemonTile> {
  List<PokemonTypeModel>? types;

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async {
        await PokemonHandler.getPokemonType(widget.pokemon?.id ?? 0)
            .then((value) {
          if (!mounted) return;
          setState(() => types = value);
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: types?.first.name.toString().pokemonColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black26.withOpacity(0.2),
            offset: const Offset(0.0, 0.0),
            blurRadius: 5.0,
            spreadRadius: 0.10,
          )
        ],
      ),
      child: (types != null)
          ? Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // TODO:
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        widget.pokemon?.name?.toString().capitalize ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Flexible(
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...?types?.map((type) => Type(type.name))
                              ],
                            ),
                            Flexible(
                                child: Image.network(
                              widget.pokemon?.id.toString().pokemonImage ?? '',
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: spinKitRipple,
                                );
                              },
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(child: spinKitHourGlass),
    );
  }
}

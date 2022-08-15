import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api/api_service.dart';
import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/api/models/pokemon_type_model.dart';
import 'package:pokedex/features/details_page/details_page_connector.dart';
import 'package:pokedex/features/home_page/widgets/type.dart';
import 'package:pokedex/utilities/app_starter.dart';
import 'package:pokedex/utilities/constants.dart';
import 'package:pokedex/utilities/extensions.dart';

class PokemonTile extends StatefulWidget {
  const PokemonTile({
    this.pokemon,
    Key? key,
  }) : super(key: key);

  final PokemonModel? pokemon;

  @override
  State<PokemonTile> createState() => _PokemonTileState();
}

class _PokemonTileState extends State<PokemonTile> {
  List<PokemonTypeModel>? types;
  String? url;

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async {
        await getIt<ApiService>().pokemonApi.getPokemonType(widget.pokemon?.url ?? '').then((value) {
          if (!mounted) return;
          setState(() => types = value);
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: types?.first.name.toString().pokemonColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black26.withOpacity(0.2),
            offset: const Offset(0.0, 0.0),
            spreadRadius: 0.10,
          )
        ],
      ),
      child: (types != null)
          ? Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DetailsPageConnector.route,
                    arguments: DetailsPageConnectorArgs(specificPokemon: widget.pokemon!),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        widget.pokemon?.name?.toString().replaceDash.toTitleCase ?? '',
                        style: textTheme.headline1?.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 8.0),
                      Flexible(
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [...?types?.map((type) => Type(typeName: type.name))],
                            ),
                            Flexible(
                              child: CachedNetworkImage(
                                imageUrl: widget.pokemon?.url?.pokemonId.toString().pokemonImage ?? '',
                                placeholder: (context, url) => spinKitRipple,
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            ),
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

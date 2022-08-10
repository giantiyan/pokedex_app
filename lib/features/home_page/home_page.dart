import 'package:flutter/material.dart';

import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/features/home_page/widgets/filter_modal.dart';
import 'package:pokedex/features/home_page/widgets/pokemon_tile.dart';
import 'package:pokedex/features/home_page/widgets/search_bar.dart';
import 'package:pokedex/utilities/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.onSearch,
    required this.onFilter,
    required this.onCancel,
    this.pokemon,
    this.isVisible,
  });

  final Function(String? query) onSearch;
  final Function(String? typeName) onFilter;
  final VoidCallback onCancel;
  final List<PokemonModel>? pokemon;
  final bool? isVisible;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Pokédex',
              style: TextStyle(fontSize: 24),
            ),
            SearchBar(onSearch: onSearch),
          ],
        ),
        centerTitle: true,
        backgroundColor: red,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 190,
          childAspectRatio: 9 / 8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: pokemon?.length,
        itemBuilder: (context, index) => PokemonTile(
          pokemon: pokemon?[index],
          key: ValueKey(pokemon?[index].name),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (isVisible == true)
            (FloatingActionButton(
              heroTag: 'cancel',
              onPressed: onCancel,
              backgroundColor: red,
              child: const Icon(Icons.cancel),
            )),
          SizedBox(width: 8),
          FloatingActionButton(
            heroTag: 'filter',
            onPressed: () => showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              isScrollControlled: true,
              builder: (context) => FilterModal(onFilter: onFilter),
            ),
            backgroundColor: orangeAccent,
            child: const Icon(Icons.filter_list),
          ),
        ],
      ),
    );
  }
}

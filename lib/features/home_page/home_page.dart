import 'package:flutter/material.dart';

import 'package:pokedex/api/models/pokemon_model.dart';
import 'package:pokedex/features/home_page/widgets/filter_modal.dart';
import 'package:pokedex/features/home_page/widgets/pokemon_tile.dart';
import 'package:pokedex/utilities/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.onCancel,
    required this.onFilter,
    this.pokemon,
    this.isVisible,
  });

  final VoidCallback onCancel;
  final Function(String? typeName) onFilter;
  final List<PokemonModel>? pokemon;
  final bool? isVisible;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(45),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Row(children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          fillColor: white,
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search here',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red[300]),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'Search',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      onPressed: () async {},
                    ),
                  ])),
            )),
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
          Visibility(
            visible: isVisible ?? false,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                onCancel();
              },
              backgroundColor: red,
              child: const Icon(Icons.cancel),
            ),
          ),
          SizedBox(width: 8),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: FilterModal(onFilter: onFilter),
                    ),
                  );
                },
              );
            },
            backgroundColor: Colors.orangeAccent,
            child: const Icon(Icons.filter_list),
          ),
        ],
      ),
    );
  }
}

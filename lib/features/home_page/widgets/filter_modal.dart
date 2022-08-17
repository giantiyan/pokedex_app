import 'package:flutter/material.dart';
import 'package:pokedex/features/home_page/widgets/type.dart';
import 'package:pokedex/utilities/colors.dart';
import 'package:pokedex/utilities/extensions.dart';
import 'package:pokedex/utilities/string_constants.dart';

class FilterModal extends StatelessWidget {
  const FilterModal({required this.onFilter});

  final Function(String typeName) onFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          ...typesList.map(
            (type) => GestureDetector(
              onTap: () {
                onFilter(type);
                Navigator.pop(context);
              },
              child: Type(
                typeName: type,
                color: type.pokemonColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

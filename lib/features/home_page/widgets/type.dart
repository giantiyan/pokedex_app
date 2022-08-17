import 'package:flutter/material.dart';
import 'package:pokedex/utilities/colors.dart';
import 'package:pokedex/utilities/extensions.dart';

class Type extends StatelessWidget {
  const Type({
    this.typeName,
    this.color,
  });

  final String? typeName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.only(
        bottom: 8,
        right: 4,
      ),
      child: Text(
        typeName?.toTitleCase ?? '',
        style: textTheme.subtitle1?.copyWith(color: white),
      ),
    );
  }
}

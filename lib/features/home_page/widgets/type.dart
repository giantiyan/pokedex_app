import 'package:flutter/material.dart';
import 'package:pokedex/utilities/extensions.dart';

class Type extends StatelessWidget {
  const Type(this.typeName);

  final String? typeName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 5,
          ),
          margin: EdgeInsets.only(
            bottom: 8,
            right: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.25),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Text(
            typeName?.capitalize ?? '',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

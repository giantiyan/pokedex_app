import 'package:flutter/material.dart';

class AboutInformation extends StatelessWidget {
  const AboutInformation({
    this.label,
    this.value,
  });

  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label ?? '',
              style: textTheme.labelMedium,
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              value ?? '',
              style: textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex/utilities/extensions.dart';

class BaseStatsInformation extends StatelessWidget {
  const BaseStatsInformation({
    this.label,
    this.value,
  });

  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value ?? '',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                value: double?.parse(value ?? '0') / 200,
                valueColor: new AlwaysStoppedAnimation<Color>(
                    (value ?? '0').toString().baseStatsColor),
                backgroundColor: Colors.grey[200],
                minHeight: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

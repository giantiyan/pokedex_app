import 'package:flutter/material.dart';
import 'package:pokedex/utilities/colors.dart';
import 'package:intl/intl.dart';

extension StringExt on String {
  String get capitalize =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String get toTitleCase => this
      .toLowerCase()
      .split(' ')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');

  String get pokemonImage {
    // return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$this.png';
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$this.png';
  }

  Color get pokemonColor {
    var color = white;

    switch (this) {
      case 'fire':
        {
          color = kFire;
        }
        break;
      case 'grass':
        {
          color = kGrass;
        }
        break;
      case 'water':
        {
          color = kWater;
        }
        break;
      case 'normal':
        {
          color = kNormal;
        }
        break;
      case 'flying':
        {
          color = kFlying;
        }
        break;
      case 'bug':
        {
          color = kBug;
        }
        break;
      case 'poison':
        {
          color = kPoison;
        }
        break;
      case 'ground':
        {
          color = kGround;
        }
        break;
      case 'electric':
        {
          color = kElectric;
        }
        break;
      case 'fighting':
        {
          color = kFighting;
        }
        break;
      case 'psychic':
        {
          color = kPsychic;
        }
        break;
      case 'rock':
        {
          color = kRock;
        }
        break;
      case 'ice':
        {
          color = kIce;
        }
        break;
      case 'ghost':
        {
          color = kGhost;
        }
        break;
      case 'dragon':
        {
          color = kDragon;
        }
        break;
      case 'dark':
        {
          color = kDark;
        }
        break;
      case 'steel':
        {
          color = kSteel;
        }
        break;
      case 'fairy':
        {
          color = kFairy;
        }
        break;

      default:
        {
          color = white;
        }
        break;
    }

    return color;
  }

  String get formatID {
    var formatter = new NumberFormat('000');
    return '#${formatter.format(int.parse(this))}';
  }

  String get replaceBracket => replaceAll('[', '').replaceAll(']', '');

  String get replaceDash => replaceAll('-', ' ');

  String get removeParenthesis => replaceAll(')', '').replaceAll('(', '');

  String get toHeight {
    var convert = double.parse(this) / 10;
    return convert.toString() + ' m';
  }

  String get toWeight {
    var convert = double.parse(this) / 10;
    return convert.toString() + ' kg';
  }

  String get toBaseExp => '$this xp';

  String get shortcut => replaceAll('special', 'Sp')
      .replaceAll('Special', 'Sp')
      .replaceAll('attack', 'Atk')
      .replaceAll('defense', 'Def');

  String get baseStatLabel {
    if (this == 'hp')
      return this.toUpperCase();
    else if (this == 'attack' || this == 'defense' || this == 'speed')
      return this.capitalize;
    else
      return this.shortcut;
  }

}

extension ListStringExt on List<String> {
  String get capitalizedAbilities => map((ability) => ability).toString().removeParenthesis.replaceDash.toTitleCase;
}

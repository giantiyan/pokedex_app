import 'package:flutter/material.dart';
import 'package:pokedex/utilities/colors.dart';
import 'package:intl/intl.dart';

extension StringExt on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String get toTitleCase =>
      this.toLowerCase().split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');

  int get pokemonId => int.parse(Uri.parse(this).pathSegments[3]);

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

  String get replaceBracket => replaceAll('[', '').replaceAll(']', '');

  String get replaceDash => replaceAll('-', ' ');

  String get removeParenthesis => replaceAll(')', '').replaceAll('(', '');

}

extension IntExt on int {
  String get toHeight => '${this / 10} m';

  String get toWeight => '${this / 10} kg';

  String get toBaseExp => '$this xp';

  String get formatId {
    var formatter = new NumberFormat('000');
    return '#${formatter.format(this)}';
  }

  String get pokemonImage => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$this.png';
}

extension ListStringExt on List<String> {
  String get capitalizedAbilities => map((ability) => ability).toString().removeParenthesis.replaceDash.toTitleCase;
}



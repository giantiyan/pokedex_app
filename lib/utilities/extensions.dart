import 'package:flutter/material.dart';
import 'package:pokedex/utilities/constants.dart';

extension StringExt on String {
  String get capitalize =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String get pokemonImage {
    // return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$this.png';
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$this.png';
  }

  Color get pokemonColor {
    var color = Colors.white;

    switch(this) {
      case 'fire': {  color = kFire; }
      break;
      case 'grass': {  color = kGrass; }
      break;
      case 'water': {  color = kWater; }
      break;
      case 'normal': {  color = kNormal; }
      break;
      case 'flying': {  color = kFlying; }
      break;
      case 'bug': {  color = kBug; }
      break;
      case 'poison': {  color = kPoison; }
      break;
      case 'ground': {  color = kGround; }
      break;
      case 'electric': {  color = kElectric; }
      break;
      case 'fighting': {  color = kFighting; }
      break;
      case 'psychic': {  color = kPsychic; }
      break;
      case 'rock': {  color = kRock; }
      break;
      case 'ice': {  color = kIce; }
      break;
      case 'ghost': {  color = kGhost; }
      break;
      case 'dragon': {  color = kDragon; }
      break;
      case 'dark': {  color = kDark; }
      break;
      case 'steel': {  color = kSteel; }
      break;
      case 'fairy': {  color = kFairy; }
      break;
      default: { color = Colors.white; }
      break;
    }

    return color;
  }

}

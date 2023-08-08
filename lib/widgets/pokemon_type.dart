import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';

class PokemonType extends StatelessWidget {
  const PokemonType({super.key, required this.type});

  final PokemonTypes type;

  List<Color> typeColor() {
    var typeColors = [Colors.white, Colors.white];

    switch (type) {
      case PokemonTypes.bug :
        typeColors[0] = typeColors[1] = Colors.green;
        break;
      case PokemonTypes.dragon:
        typeColors[0] = Colors.blue.shade400;
        typeColors[1] = Colors.red.shade400;
        break;
      case PokemonTypes.fairy:
        typeColors[0] = typeColors[1] = Colors.pink.shade300;
        break;
      case PokemonTypes.fire:
        typeColors[0] = typeColors[1] = Colors.orange;
        break;
      case PokemonTypes.ghost:
        typeColors[0] = typeColors[1] = Colors.deepPurple;
        break;
      case PokemonTypes.ground:
        typeColors[0] = Colors.yellow;
        typeColors[1] = Colors.brown;
        break;
      case PokemonTypes.normal:
        typeColors[0] = typeColors[1] = Colors.grey;
        break;
      case PokemonTypes.psychic:
        typeColors[0] = typeColors[1] = Colors.pink;
        break;
      case PokemonTypes.steel:
        typeColors[0] = typeColors[1] = Colors.indigo.shade200;
        break;
      case PokemonTypes.dark:
        typeColors[0] = typeColors[1] = Colors.grey.shade700;
        break;
      case PokemonTypes.electric:
        typeColors[0] = typeColors[1] = Colors.yellow.shade600;
        break;
      case PokemonTypes.fighting:
        typeColors[0] = typeColors[1] = Colors.orange.shade700;
        break;
      case PokemonTypes.flying:
        typeColors[0] = Colors.blue.shade300;
        typeColors[1] = Colors.grey;
        break;
      case PokemonTypes.grass:
        typeColors[0] = typeColors[1] = Colors.limeAccent.shade400;
        break;
      case PokemonTypes.ice:
        typeColors[0] = typeColors[1] = Colors.lightBlue;
        break;
      case PokemonTypes.poison:
        typeColors[0] = typeColors[1] = Colors.purple;
        break;
      case PokemonTypes.rock:
        typeColors[0] = typeColors[1] = Colors.lime.shade900;
        break;
      case PokemonTypes.water:
        typeColors[0] = typeColors[1] = Colors.blue;
        break;
    }
    return typeColors;
  }

  String get typeName {
    return type.name[0].toUpperCase() + type.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    final typeColors = typeColor();
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [typeColors[0], typeColors[1]],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Text(typeName, 
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}

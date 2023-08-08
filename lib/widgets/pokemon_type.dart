import 'package:flutter/material.dart';

class PokemonType extends StatelessWidget {
  const PokemonType({super.key, required this.type});

  final String type;

  List<Color> typeColor() {
    var typeColors = [Colors.white, Colors.white];

    switch (type) {
      case 'bug':
        typeColors[0] = typeColors[1] = Colors.green;
        break;
      case 'dragon':
        typeColors[0] = Colors.blue.shade400;
        typeColors[1] = Colors.red.shade400;
        break;
      case 'fairy':
        typeColors[0] = typeColors[1] = Colors.pink.shade300;
        break;
      case 'fire':
        typeColors[0] = typeColors[1] = Colors.orange;
        break;
      case 'ghost':
        typeColors[0] = typeColors[1] = Colors.deepPurple;
        break;
      case 'ground':
        typeColors[0] = Colors.yellow;
        typeColors[1] = Colors.brown;
        break;
      case 'normal':
        typeColors[0] = typeColors[1] = Colors.grey;
        break;
      case 'psychic':
        typeColors[0] = typeColors[1] = Colors.pink;
        break;
      case 'steel':
        typeColors[0] = typeColors[1] = Colors.indigo.shade200;
        break;
      case 'dark':
        typeColors[0] = typeColors[1] = Colors.grey.shade700;
        break;
      case 'electric':
        typeColors[0] = typeColors[1] = Colors.yellow.shade600;
        break;
      case 'fighting':
        typeColors[0] = typeColors[1] = Colors.orange.shade700;
        break;
      case 'flying':
        typeColors[0] = Colors.blue.shade300;
        typeColors[1] = Colors.grey;
        break;
      case 'grass':
        typeColors[0] = typeColors[1] = Colors.limeAccent.shade400;
        break;
      case 'ice':
        typeColors[0] = typeColors[1] = Colors.lightBlue;
        break;
      case 'poison':
        typeColors[0] = typeColors[1] = Colors.purple;
        break;
      case 'Rock':
        typeColors[0] = typeColors[1] = Colors.lime.shade900;
        break;
      case 'water':
        typeColors[0] = typeColors[1] = Colors.blue;
        break;
    }
    return typeColors;
  }

  String get typeName {
    return type[0].toUpperCase() + type.substring(1);
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
        borderRadius: BorderRadius.circular(16),
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

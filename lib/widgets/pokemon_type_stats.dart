import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';

import 'package:pokedex/widgets/pokemon_type.dart';

class PokemonTypeStats extends StatelessWidget {
  const PokemonTypeStats({super.key, required this.pokemon});

  final Pokemon pokemon;

  Widget getTypeRow(List<PokemonTypes> types) {
    if (types.length > 5) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: false,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [for (final t in types) PokemonType(type: t)]),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [for (final t in types) PokemonType(type: t)]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Type',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        getTypeRow(pokemon.types),
        const SizedBox(
          height: 12,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Strengths',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        getTypeRow(pokemon.strengths),
        const SizedBox(
          height: 12,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Weaknesses',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        getTypeRow(pokemon.weaknesses),
      ],
    );
  }
}

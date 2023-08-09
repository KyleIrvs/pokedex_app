import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemon_data.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_circle_item.dart';

class PokemonEvolutions extends StatelessWidget {
  const PokemonEvolutions({super.key, required this.currentPokemon});

  final Pokemon currentPokemon;

  List<List<Pokemon>> getEvolutions(Pokemon p) {
    List<List<Pokemon>> pokemonEvolutions = [[], [], []];

    while (p.previousEvolution != 0) {
      p = starterPokemon.firstWhere((pokemon) =>
          pokemon.pokedexNumber == p.previousEvolution ? true : false);
    }
    pokemonEvolutions[0].insert(0, p);
    pokemonEvolutions[1].insertAll(
        0,
        starterPokemon
            .where((pokemon) =>
                pokemon.previousEvolution == p.pokedexNumber ? true : false)
            .toList());
    p = starterPokemon.firstWhere(
        (pokemon) => pokemon.pokedexNumber == p.evolution ? true : false);
    pokemonEvolutions[2].insertAll(
        0,
        starterPokemon
            .where((pokemon) =>
                pokemon.previousEvolution == p.pokedexNumber ? true : false)
            .toList());

    return pokemonEvolutions;
  }

  Widget getRow(List<Pokemon> evolutionList) {
    if (evolutionList.length > 1) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final pokemon in evolutionList)
              pokemon == currentPokemon
                  ? PokemonCircleItem(pokemon: pokemon, currentPokemon: true)
                  : PokemonCircleItem(pokemon: pokemon)
          ],
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final pokemon in evolutionList)
            pokemon == currentPokemon
                ? PokemonCircleItem(pokemon: pokemon, currentPokemon: true)
                : PokemonCircleItem(pokemon: pokemon),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget output;

    if (currentPokemon.evolution == 0 &&
        currentPokemon.previousEvolution == 0) {
      output = Text(
        "This Pokemon does not have any evolutions",
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
        textAlign: TextAlign.center,
      );
    } else {
      List<List<Pokemon>> evolutions = getEvolutions(currentPokemon);
      output = Column(
        children: [
          Text(
            "Evolutions",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
          ),
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                getRow(evolutions[0]),
                if (evolutions[1].isEmpty) ...[
                ] else if (evolutions[2].isEmpty) ...[
                  const Icon(Icons.arrow_downward),
                  getRow(evolutions[1]),
                ] else ...[
                  const Icon(Icons.arrow_downward),
                  getRow(evolutions[1]),
                  const Icon(Icons.arrow_downward),
                  getRow(evolutions[2]),
                ]
              ],
            ),
          ),
        ],
      );
    }

    return output;
  }
}

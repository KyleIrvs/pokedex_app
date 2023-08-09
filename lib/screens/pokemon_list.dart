import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/pokemon_details.dart';
import 'package:pokedex/widgets/pokemon_item.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({
    super.key,
    required this.pokemonList,
    required this.regionName,
  });

  final String regionName;
  final List<Pokemon> pokemonList;

  void _onSelectPokemon(BuildContext context, Pokemon p) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => PokemonDetailsScreen(pokemon: p),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "$regionName Pokemon",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          backgroundColor:
              Theme.of(context).colorScheme.primary.withBlue(64).withGreen(64)),
      body: GridView(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3.2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        children: [
          for (final poke in pokemonList)
            PokemonItem(
              poke: poke,
              onSelectPokemon: () {
                _onSelectPokemon(context, poke);
              },
            )
        ],
      ),
    );
  }
}

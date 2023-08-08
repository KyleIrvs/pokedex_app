import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/pokemon_details.dart';
import 'package:pokedex/widgets/pokemon_thumbnail.dart';

class PokemonItemsScreen extends StatelessWidget {
  const PokemonItemsScreen({
    super.key,
    required this.pokemonList,
  });

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
            "Select a Pokemon to Learn more.",
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
          childAspectRatio: 2 / 3.1,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        children: [
          for (final poke in pokemonList)
            PokemonThumbnail(
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

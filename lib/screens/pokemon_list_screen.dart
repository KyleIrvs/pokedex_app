import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/pokemon_details.dart';
import 'package:pokedex/screens/pokemon_search.dart';
import 'package:pokedex/widgets/pokemon_item.dart';
import 'package:pokedex/widgets/pokemon_list.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({
    super.key,
    required this.pokemonList,
    required this.regionName,
    required this.regionNumber,
  });

  final String regionName;
  final int regionNumber;
  final List<Pokemon> pokemonList;

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
              Theme.of(context).colorScheme.primary.withBlue(64).withGreen(64),
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => SearchScreen(generation: regionNumber))),
                icon: const Icon(Icons.search))
          ],
        ),
        body: PokemonList(
          pokemonList: pokemonList,
        ));
  }
}

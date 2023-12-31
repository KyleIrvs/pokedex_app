import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_evolutions.dart';
import 'package:pokedex/widgets/pokemon_physical_info.dart';
import 'package:pokedex/widgets/chart/pokemon_stats_chart.dart';
import 'package:pokedex/widgets/pokemon_type_stats.dart';

class PokemonDetailsScreen extends StatelessWidget {
  const PokemonDetailsScreen({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                pokemon.name,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                "#${pokemon.pokedexNumber.toString().padLeft(4, '0')}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color.fromARGB(255, 170, 170, 170),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              )
            ],
          ),
          backgroundColor:
              Theme.of(context).colorScheme.primary.withBlue(64).withGreen(64)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 24,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/pokeball_bg.png',
                image: pokemon.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                pokemon.description,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 16,
                    ),
              ),
            ),
            PokemonPhysicalInfo(physicalInfo: pokemon.physicalInfo),
            const SizedBox(
              height: 16,
            ),
            PokemonTypeStats(pokemon: pokemon),
            const SizedBox(
              height: 16,
            ),
            PokemonStats(
              stats: pokemon.battleStats,
            ),
            const SizedBox(
              height: 16,
            ),
            PokemonEvolutions(currentPokemon: pokemon),
          ],
        ),
      ),
    );
  }
}

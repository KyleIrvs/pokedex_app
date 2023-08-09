import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokemon_list.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:pokedex/data/pokemon_data.dart';

class RegionsScreen extends StatelessWidget {
  const RegionsScreen({super.key});

  void _onSelectRegion(BuildContext context, String regionName, int gen) {
    final generationPokemon =
        starterPokemon.where((p) => p.generation == gen).toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => PokemonListScreen(
            pokemonList: generationPokemon, regionName: regionName)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Select a Region.",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          backgroundColor:
              Theme.of(context).colorScheme.primary.withBlue(64).withGreen(64)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final region in regions)
              InkWell(
                onTap: () {
                  _onSelectRegion(context, region.name, region.generation);
                },
                highlightColor: Theme.of(context).primaryColor,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: NetworkImage(region.imageUrl),
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.center,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(200, 15, 15, 15),
                        ),
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                region.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70,
                                    ),
                              ),
                              Text(
                                "Gen ${region.generation.toString()}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white54),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

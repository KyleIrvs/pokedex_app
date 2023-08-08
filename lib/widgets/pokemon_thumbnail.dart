import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_type.dart';

class PokemonThumbnail extends StatelessWidget {
  const PokemonThumbnail({super.key, required this.poke, required this.onSelectPokemon});

  final Pokemon poke;
  final void Function() onSelectPokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 233, 233, 233),
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: onSelectPokemon,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage(
              placeholder: const AssetImage('assets/images/pokeball_bg.png'),
              image: NetworkImage(poke.imageUrl),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "#${poke.pokedexNumber.toString().padLeft(4, '0')}",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color.fromARGB(255, 170, 170, 170),
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                poke.name,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [for (final t in poke.types) PokemonType(type: t)],
            )
          ],
        ),
      ),
    );
  }
}

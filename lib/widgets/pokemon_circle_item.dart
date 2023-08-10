import 'package:flutter/material.dart';

import 'package:pokedex/models/pokemon.dart';

class PokemonCircleItem extends StatelessWidget {
  const PokemonCircleItem(
      {super.key, required this.pokemon, this.currentPokemon = false});

  final Pokemon pokemon;
  final bool currentPokemon;
  

  //Possibly make clickable to move to that pokemon 

  @override
  Widget build(BuildContext context) {
    Color circleColour;
    currentPokemon
        ? circleColour = const Color.fromARGB(255, 32, 89, 146)
        : circleColour = const Color.fromARGB(255, 68, 68, 68);

    return Container(
      margin: const EdgeInsets.all(30),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 8,
            offset:const Offset(0, 5),
          )
        ],
        color: circleColour,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          style: BorderStyle.solid,
          width: 5,
        ),
      ),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 32),
            child: Image.network(pokemon.imageUrl, fit: BoxFit.fitWidth)),
        Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Text(
            pokemon.name,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            "#${pokemon.pokedexNumber.toString().padLeft(4, '0')}",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 170, 170, 170),
                ),
          ),
        ),
      ]),
    );
  }
}

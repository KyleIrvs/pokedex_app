enum PokemonTypes {
  bug,
  dragon,
  fairy,
  fire,
  ghost,
  ground,
  normal,
  psychic,
  steel,
  dark,
  electric,
  fighting,
  flying,
  grass,
  ice,
  poison,
  rock,
  water,
}

Map pokemonTypeEffectiveness = {
  PokemonTypes.normal: {
    "strong": [],
    "weak": [PokemonTypes.rock, PokemonTypes.ghost, PokemonTypes.steel],
    "resistant": [PokemonTypes.ghost],
    "vulnerable": [PokemonTypes.fighting],
  },
  PokemonTypes.poison: {
    "strong": [PokemonTypes.grass, PokemonTypes.fairy],
    "weak": [
      PokemonTypes.poison,
      PokemonTypes.ground,
      PokemonTypes.rock,
      PokemonTypes.ghost,
      PokemonTypes.steel
    ],
    "resistant": [
      PokemonTypes.fighting,
      PokemonTypes.poison,
      PokemonTypes.grass,
      PokemonTypes.fairy
    ],
    "vulnerable": [PokemonTypes.ground, PokemonTypes.psychic],
  },
  PokemonTypes.grass: {
    "strong": [PokemonTypes.ground, PokemonTypes.rock, PokemonTypes.water],
    "weak": [
      PokemonTypes.flying,
      PokemonTypes.poison,
      PokemonTypes.bug,
      PokemonTypes.steel,
      PokemonTypes.fire,
      PokemonTypes.grass
    ],
    "resistant": [
      PokemonTypes.ground,
      PokemonTypes.water,
      PokemonTypes.grass,
      PokemonTypes.electric
    ],
    "vulnerable": [
      PokemonTypes.flying,
      PokemonTypes.poison,
      PokemonTypes.bug,
      PokemonTypes.fire,
      PokemonTypes.ice
    ],
  },
  PokemonTypes.fire: {
    "strong": [
      PokemonTypes.bug,
      PokemonTypes.steel,
      PokemonTypes.grass,
      PokemonTypes.ice
    ],
    "weak": [
      PokemonTypes.rock,
      PokemonTypes.fire,
      PokemonTypes.water,
      PokemonTypes.dragon
    ],
    "resistant": [
      PokemonTypes.bug,
      PokemonTypes.steel,
      PokemonTypes.fire,
      PokemonTypes.grass,
      PokemonTypes.ice
    ],
    "vulnerable": [PokemonTypes.ground, PokemonTypes.rock, PokemonTypes.water],
  },
  PokemonTypes.flying: {
    "strong": [PokemonTypes.fighting, PokemonTypes.bug, PokemonTypes.grass],
    "weak": [PokemonTypes.rock, PokemonTypes.steel, PokemonTypes.electric],
    "resistant": [
      PokemonTypes.fighting,
      PokemonTypes.ground,
      PokemonTypes.bug,
      PokemonTypes.grass
    ],
    "vulnerable": [PokemonTypes.rock, PokemonTypes.electric, PokemonTypes.ice]
  },
  PokemonTypes.water: {
    "strong": [PokemonTypes.ground, PokemonTypes.rock, PokemonTypes.fire],
    "weak": [PokemonTypes.water, PokemonTypes.grass, PokemonTypes.dragon],
    "resistant": [
      PokemonTypes.steel,
      PokemonTypes.fire,
      PokemonTypes.water,
      PokemonTypes.ice
    ],
    "vulnerable": [PokemonTypes.grass, PokemonTypes.electric],
  },
};

enum PokemonGenders {
  male,
  female,
}

class Pokemon {
  const Pokemon({
    required this.name,
    required this.pokedexNumber,
    required this.generation,
    required this.types,
    required this.description,
    required this.imageUrl,
    required this.physicalInfo,
    required this.battleStats,
    this.previousEvolution = 0,
    this.evolution = 0,
  });

  final String name;
  final int pokedexNumber;
  final int generation;
  final List<PokemonTypes> types;
  final String description;
  final String imageUrl;
  final Map<String, dynamic> physicalInfo;
  final Map<String, double> battleStats;
  final int previousEvolution;
  final int evolution;

  List<PokemonTypes> get weaknesses {
    List<PokemonTypes> currentWeaknesses = [];
    for (final type in types) {
      for (final w in pokemonTypeEffectiveness[type]["vulnerable"]) {
        if (!currentWeaknesses.contains(w)) {
          currentWeaknesses.add(w);
        }
      }
    }

    for (final type in types) {
      if (currentWeaknesses.contains(type)) {
        currentWeaknesses.remove(type);
      }
      for (final s in pokemonTypeEffectiveness[type]["strong"]) {
        if (currentWeaknesses.contains(s)) {
          currentWeaknesses.remove(s);
        }
      }
    }
    return currentWeaknesses;
  }

  List<PokemonTypes> get strengths {
    List<PokemonTypes> currentStrengths = [];

    for (final type in types) {
      for (final s in pokemonTypeEffectiveness[type]["strong"]) {
        if (!currentStrengths.contains(s)) {
          currentStrengths.add(s);
        }
      }
    }

    for (final type in types) {
      if (currentStrengths.contains(type)) currentStrengths.remove(type);
      for (final w in pokemonTypeEffectiveness[type]["vulnerable"]) {
        if (currentStrengths.contains(w)) {
          currentStrengths.remove(w);
        }
      }
    }
    return currentStrengths;
  }
}

class Region {
  const Region({required this.name, required this.imageUrl, required this.generation});

  final String name;
  final String imageUrl;
  final int generation;
}

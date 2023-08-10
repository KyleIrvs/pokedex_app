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
  PokemonTypes.grass: {
    "strong": [PokemonTypes.water, PokemonTypes.ground, PokemonTypes.rock],
    "vulnerable": [
      PokemonTypes.fire,
      PokemonTypes.flying,
      PokemonTypes.bug,
      PokemonTypes.poison,
      PokemonTypes.ice
    ],
  },
  PokemonTypes.water: {
    "strong": [PokemonTypes.fire, PokemonTypes.ground, PokemonTypes.rock],
    "vulnerable": [PokemonTypes.grass, PokemonTypes.electric],
  },
  PokemonTypes.fire: {
    "strong": [
      PokemonTypes.grass,
      PokemonTypes.bug,
      PokemonTypes.ice,
      PokemonTypes.steel
    ],
    "vulnerable": [PokemonTypes.water, PokemonTypes.ground, PokemonTypes.rock],
  },
  PokemonTypes.normal: {
    "strong": [],
    "vulnerable": [PokemonTypes.fighting],
  },
  PokemonTypes.fighting: {
    "strong": [
      PokemonTypes.normal,
      PokemonTypes.steel,
      PokemonTypes.ice,
      PokemonTypes.rock,
      PokemonTypes.dark
    ],
    "vulnerable": [
      PokemonTypes.psychic,
      PokemonTypes.fairy,
      PokemonTypes.flying
    ],
  },
  PokemonTypes.electric: {
    "strong": [PokemonTypes.water, PokemonTypes.flying],
    "vulnerable": [
      PokemonTypes.ground,
    ],
  },
  PokemonTypes.flying: {
    "strong": [PokemonTypes.fighting, PokemonTypes.grass, PokemonTypes.bug],
    "vulnerable": [PokemonTypes.electric, PokemonTypes.ice, PokemonTypes.rock],
  },
  PokemonTypes.ground: {
    "strong": [
      PokemonTypes.fire,
      PokemonTypes.poison,
      PokemonTypes.rock,
      PokemonTypes.steel
    ],
    "vulnerable": [PokemonTypes.water, PokemonTypes.grass, PokemonTypes.ice],
  },
  PokemonTypes.rock: {
    "strong": [
      PokemonTypes.fire,
      PokemonTypes.ice,
      PokemonTypes.flying,
      PokemonTypes.bug,
    ],
    "vulnerable": [
      PokemonTypes.water,
      PokemonTypes.grass,
      PokemonTypes.fighting,
      PokemonTypes.ground,
      PokemonTypes.steel
    ],
  },
  PokemonTypes.psychic: {
    "strong": [PokemonTypes.fighting, PokemonTypes.poison],
    "vulnerable": [PokemonTypes.bug, PokemonTypes.ghost, PokemonTypes.dark],
  },
  PokemonTypes.ghost: {
    "strong": [PokemonTypes.psychic, PokemonTypes.ghost],
    "vulnerable": [PokemonTypes.ghost, PokemonTypes.dark],
  },
  PokemonTypes.dark: {
    "strong": [ PokemonTypes.psychic, PokemonTypes.ghost],
    "vulnerable": [ PokemonTypes.fighting, PokemonTypes.bug, PokemonTypes.fairy],
  },
  PokemonTypes.bug: {
    "strong": [ PokemonTypes.grass, PokemonTypes.psychic,  PokemonTypes.dark],
    "vulnerable": [PokemonTypes.fire, PokemonTypes.flying, PokemonTypes.fairy],
  },
  PokemonTypes.poison: {
    "strong": [PokemonTypes.grass, PokemonTypes.fairy],
    "vulnerable": [PokemonTypes.ground, PokemonTypes.psychic],
  },
  PokemonTypes.steel: {
    "strong": [PokemonTypes.ice, PokemonTypes.rock, PokemonTypes.fairy],
    "vulnerable": [PokemonTypes.fire, PokemonTypes.fighting, PokemonTypes.ground],
  },
  PokemonTypes.ice: {
    "strong": [PokemonTypes.grass, PokemonTypes.ground, PokemonTypes.flying, PokemonTypes.dragon],
    "vulnerable": [PokemonTypes.fire, PokemonTypes.fighting, PokemonTypes.rock, PokemonTypes.steel],
  },
  PokemonTypes.dragon: {
    "strong": [PokemonTypes.dragon],
    "vulnerable": [PokemonTypes.dragon, PokemonTypes.fairy],
  },
  PokemonTypes.fairy: {
    "strong": [PokemonTypes.dragon, PokemonTypes.fighting, PokemonTypes.dark],
    "vulnerable": [PokemonTypes.poison, PokemonTypes.steel],
  },
};

enum PokemonGenders {
  male,
  female,
}

class Pokemon {
  Pokemon({
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
  int previousEvolution;
  int evolution;

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
  const Region(
      {required this.name, required this.imageUrl, required this.generation});

  final String name;
  final String imageUrl;
  final int generation;
}

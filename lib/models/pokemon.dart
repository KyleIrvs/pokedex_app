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
    this.evolution = "None",
  });

  final String name;
  final int pokedexNumber;
  final int generation;
  final List<PokemonTypes> types;
  final String description;
  final String imageUrl;
  final Map<String, dynamic> physicalInfo;
  final String evolution;
}

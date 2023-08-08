enum Types {
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

class Pokemon {
  const Pokemon(
      {required this.name,
      required this.pokedexNumber,
      required this.generation,
      required this.types,
      required this.description,
      required this.imageUrl,
      this.evolution = "None"});

  final String name;
  final int pokedexNumber;
  final int generation;
  final List<Types> types;
  final String description;
  final String imageUrl;
  final String evolution;
}

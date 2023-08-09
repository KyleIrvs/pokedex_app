import 'package:pokedex/models/pokemon.dart';

const starterPokemon = [
  Pokemon(
    name: "Bulbasaur",
    pokedexNumber: 1,
    generation: 1,
    types: [PokemonTypes.grass, PokemonTypes.poison],
    description:
        "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.",
    imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
    physicalInfo: {
      'Height': '2\' 04"',
      'Category': 'Seed',
      'Weight': 15.2,
      'Abilities': 'Overgrow',
      'Gender': [PokemonGenders.male, PokemonGenders.female],
    },
    battleStats: {
      "HP": 3,
      "Attack": 3,
      "Defense": 3,
      "Special Attack": 4,
      "Special Defense": 4,
      "Speed": 3
    },
    previousEvolution: 0,
    evolution: 2,
  ),
  Pokemon(
    name: "Ivysaur",
    pokedexNumber: 2,
    generation: 1,
    types: [PokemonTypes.grass, PokemonTypes.poison],
    description:
        "When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.",
    imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/002.png",
    physicalInfo: {
      'Height': '3\' 03"',
      'Category': 'Seed',
      'Weight': 28.7,
      'Abilities': 'Overgrow',
      'Gender': [PokemonGenders.male, PokemonGenders.female],
    },
    battleStats: {
      "HP": 4,
      "Attack": 4,
      "Defense": 4,
      "Sp Attack": 5,
      "Sp Defense": 5,
      "Speed": 4
    },
    evolution: 3,
    previousEvolution: 1,
  ),
  Pokemon(
    name: "Venusar",
    pokedexNumber: 3,
    generation: 1,
    types: [PokemonTypes.grass, PokemonTypes.poison],
    description:
        "Its plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.",
    imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/003.png",
    physicalInfo: {
      'Height': '6\' 07"',
      'Category': 'Seed',
      'Weight': 220.5,
      'Abilities': 'Overgrow',
      'Gender': [PokemonGenders.male, PokemonGenders.female],
    },
    battleStats: {
      "HP": 5,
      "Attack": 5,
      "Defense": 5,
      "Sp Attack": 6,
      "Sp Defense": 6,
      "Speed": 5,
    },
    previousEvolution: 2,
  ),
  Pokemon(
    name: "Charmander",
    pokedexNumber: 4,
    generation: 1,
    types: [PokemonTypes.fire],
    description:
        "It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail.",
    imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png",
    physicalInfo: {
      'Height': '2\' 04"',
      'Category': 'Seed',
      'Weight': 15.2,
      'Abilities': 'Overgrow',
      'Gender': [PokemonGenders.male, PokemonGenders.female],
    },
    battleStats: {
      "HP": 3,
      "Attack": 3,
      "Defense": 3,
      "Sp Attack": 4,
      "Sp Defense": 4,
      "Speed": 3
    },
    evolution: 5,
    previousEvolution: 0,
  ),
  Pokemon(
    name: "Charmeleon",
    pokedexNumber: 5,
    generation: 1,
    types: [PokemonTypes.fire],
    description:
        "It has a barbaric nature. In battle, it whips its fiery tail around and slashes away with sharp claws.",
    imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/005.png",
    physicalInfo: {
      'Height': '2\' 04"',
      'Category': 'Seed',
      'Weight': 15.2,
      'Abilities': 'Overgrow',
      'Gender': [PokemonGenders.male, PokemonGenders.female],
    },
    battleStats: {
      "HP": 3,
      "Attack": 3,
      "Defense": 3,
      "Sp Attack": 4,
      "Sp Defense": 4,
      "Speed": 3
    },
    evolution: 6,
    previousEvolution: 4,
  ),
  Pokemon(
    name: "Charizard",
    pokedexNumber: 6,
    generation: 1,
    types: [PokemonTypes.fire, PokemonTypes.flying],
    description:
        "It is said that Charizard's fire burns hotter if it has experienced harsh battles. ",
    imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/006.png",
    physicalInfo: {
      'Height': '2\' 04"',
      'Category': 'Seed',
      'Weight': 15.2,
      'Abilities': 'Overgrow',
      'Gender': [PokemonGenders.male, PokemonGenders.female],
    },
    battleStats: {
      "HP": 3,
      "Attack": 3,
      "Defense": 3,
      "Sp Attack": 4,
      "Sp Defense": 4,
      "Speed": 3
    },
    previousEvolution: 5
  ),
  Pokemon(
    name: "Squirtle",
    pokedexNumber: 7,
    generation: 1,
    types: [PokemonTypes.water],
    description:
        "When it retracts its long neck into its shell, it squirts out water with vigorous force.",
    imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png",
    physicalInfo: {
      'Height': '2\' 04"',
      'Category': 'Seed',
      'Weight': 15.2,
      'Abilities': 'Overgrow',
      'Gender': [PokemonGenders.male, PokemonGenders.female],
    },
    battleStats: {
      "HP": 3,
      "Attack": 3,
      "Defense": 3,
      "Special Attack": 4,
      "Special Defense": 4,
      "Speed": 3
    },
    evolution: 8,
  ),
  Pokemon(
    name: "Wartortle",
    pokedexNumber: 8,
    generation: 1,
    types: [PokemonTypes.water],
    description:
        "It is recognized as a symbol of longevity. If its shell has algae on it, that Wartortle is very old.",
    imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/008.png",
    physicalInfo: {
      'Height': '2\' 04"',
      'Category': 'Seed',
      'Weight': 15.2,
      'Abilities': 'Overgrow',
      'Gender': [PokemonGenders.male, PokemonGenders.female],
    },
    battleStats: {
      "HP": 3,
      "Attack": 3,
      "Defense": 3,
      "Sp Attack": 4,
      "Sp Defense": 4,
      "Speed": 3
    },
    evolution: 9,
  ),
  Pokemon(
    name: "Blastoise",
    pokedexNumber: 9,
    generation: 1,
    types: [PokemonTypes.water],
    description:
        "It crushes its foe under its heavy body to cause fainting. In a pinch, it will withdraw inside its shell.",
    imageUrl: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/009.png",
    physicalInfo: {
      'Height': '2\' 04"',
      'Category': 'Seed',
      'Weight': 15.2,
      'Abilities': 'Overgrow',
      'Gender': [PokemonGenders.male, PokemonGenders.female],
    },
    battleStats: {
      "HP": 3,
      "Attack": 3,
      "Defense": 3,
      "Sp Attack": 4,
      "Sp Defense": 4,
      "Speed": 3
    },
  ),
];

const regions = [
  Region(
    name: 'Kanto',
    imageUrl:
        "https://archives.bulbagarden.net/media/upload/thumb/2/25/LGPE_Kanto_Map.png/1200px-LGPE_Kanto_Map.png",
    generation: 1,
  ),
];
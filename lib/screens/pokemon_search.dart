import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemon_data.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.generation});

  final int generation;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  List<Pokemon> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(_updateSearch);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _updateSearch() {
    setState(() {
      searchResults = pokemonList.where((pokemon) {
        if ((pokemon.name
                .toLowerCase()
                .contains(searchController.text.toLowerCase())) &&
            (widget.generation == pokemon.generation ||
                widget.generation == 0)) {
          return true;
        } else if (pokemon.pokedexNumber.toString() == searchController.text) {
          return true;
        } else {
          return false;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final String labelText;

    widget.generation != 0
        ? labelText = "Search Gen ${widget.generation} pokemon"
        : labelText = "Search all pokemon";

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.primary.withBlue(64).withGreen(64),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              autofocus: true,
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 3),
                border: InputBorder.none,
                hintText: labelText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: searchResults.isEmpty
          ? Center(
              child: Text(
              "No Pokemon found.",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ))
          : PokemonList(pokemonList: searchResults),
    );
  }
}

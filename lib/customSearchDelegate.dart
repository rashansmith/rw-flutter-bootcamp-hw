import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';
import 'pokemon_details.dart';
import 'main.dart';

class CustomSearchDelegate extends SearchDelegate {
  // Get list of all Pokemon
  List<Pokemon> pList = Pokemon.pokemonList;

  // Clear the query
  @override
  List<Widget> buildActions(BuildContext context){
    return [ IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {
        query =  '';
      },
    ),
    ];
  }

  // Makes sure that we can leave and close the search bar
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Pokemon> matchQuery = [];
    for (var pokemon in pList) {
      if(pokemon.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(pokemon);
      }
    }
    return GridView.builder(
        padding: const EdgeInsets.all(2),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: matchQuery.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PokemonDetails(
                        pokemon: matchQuery[index]);
                  },
                ),
              );
            },
            child: buildPokemonCard(matchQuery[index]),
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Pokemon> matchQuery = [];
    for (var pokemon in pList) {
      if(pokemon.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(pokemon);
      }
    }
    return GridView.builder(
        padding: const EdgeInsets.all(2),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: matchQuery.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PokemonDetails(
                        pokemon: matchQuery[index]);
                  },
                ),
              );
            },
            child: buildPokemonCard(matchQuery[index]),
          );
        }
    );
  }

  static Widget buildPokemonCard(Pokemon pokemon) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(pokemon.imageUrl)),
            const SizedBox(
              height: 2.0,
            ),
            Text(
              pokemon.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Sans Serif',
              ),
            )
          ],
        ),
      ),
    );
  }

}

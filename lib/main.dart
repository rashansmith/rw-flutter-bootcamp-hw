import 'package:flutter/material.dart';
import 'pokemon.dart';
import 'pokemon_details.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'login_signin.dart';
import 'customSearchDelegate.dart';

void main() {
  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key? key}) : super(key: key);
  static const Color pokemonBlue = Color.fromARGB(255, 52, 83, 206);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          fontFamily: 'KosugiMaru',
          // scaffoldBackgroundColor: const Color.fromARGB(255, 57, 75, 215),
          primarySwatch:
              generateMaterialColor(color: Color.fromARGB(255, 57, 75, 215))),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Pokedex');
  //static String searchString = 'Pikachu';
  //List<Pokemon> currPokemonList = Pokemon.searchPokemonByName(searchString);

  @override
  Widget build(BuildContext context) {
    return Login(w: displayPokemon);
  }

  // Widget buildPokemonCard(Pokemon pokemon) {
  //   return Card(
  //     elevation: 2.0,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  //     child: Padding(
  //       padding: const EdgeInsets.all(10.0),
  //       child: Column(
  //         children: <Widget>[
  //           Image(image: AssetImage(pokemon.imageUrl)),
  //           const SizedBox(
  //             height: 2.0,
  //           ),
  //           Text(
  //             pokemon.name,
  //             style: const TextStyle(
  //               fontSize: 20.0,
  //               fontWeight: FontWeight.w700,
  //               fontFamily: 'Sans Serif',
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget displayPokemon(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: customSearchBar,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),);
              },
              icon: customIcon,
            )
          ],

      ),
      body: SafeArea(
          child: GridView.builder(
            padding: const EdgeInsets.all(2),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            ),
            itemCount: Pokemon.pokemonList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PokemonDetails(
                            pokemon: Pokemon.pokemonList[index]);
                      },
                    ),
                  );
                },
                child: CustomSearchDelegate.buildPokemonCard(Pokemon.pokemonList[index]),
              );
            }
            ),
      ),
    );
  }
}

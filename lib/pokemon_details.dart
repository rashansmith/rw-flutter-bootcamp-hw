import 'package:flutter/material.dart';
import 'pokemon.dart';

class PokemonDetails extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetails({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  _PokemonDetailsState createState() {
    return _PokemonDetailsState();
  }
}

class _PokemonDetailsState extends State<PokemonDetails> {

  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.pokemon.imageUrl),
              ),
            ),

            const SizedBox(
              height: 4,
            ),

            Text(
              widget.pokemon.name,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              widget.pokemon.type,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              widget.pokemon.caughtLocation,
              style: const TextStyle(fontSize: 18),
            ),


            Expanded(
              // 8
              child: Column(
                children: <Widget>[

                  Text(
                    widget.pokemon.name,
                    style: const TextStyle(fontSize: 18),
                  ),
              ],
            ),
            ),
        ],
            ),
      ),

    );
  }
}


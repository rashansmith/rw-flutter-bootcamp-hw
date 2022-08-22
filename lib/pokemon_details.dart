import 'dart:ffi';

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

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(
                'Name: ${widget.pokemon.name}',
                style: const TextStyle(fontSize: 24),
              ),
            ),


            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    'Pokedex Number: ${widget.pokemon.number}',
                    style: const TextStyle(fontSize: 18),
                  ),

                  Text(
                    'Type:  ${widget.pokemon.type}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Location caught at:  ${widget.pokemon.caughtLocation}',
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


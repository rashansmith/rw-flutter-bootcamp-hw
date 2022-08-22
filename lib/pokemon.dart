class Pokemon {
  double number;
  String name;
  String type;
  String caughtLocation;
  String imageUrl;

  Pokemon(this.number,
      this.name,
      this.type,
      this.caughtLocation,
      this.imageUrl);


  static List<Pokemon> pokemonList = [
    Pokemon(
        1342,
        'Psyduck',
        'Water',
        'Lavender Town',
        'assets/psyduck.png'
    ),
    Pokemon(
        1234,
        'Snorlax',
        'Normal',
        'Shalour City',
        'assets/snorlax.png'
    ),
    Pokemon(
        9428,
        'Squirtle',
        'Water',
        'Castelia City',
        'assets/squirtle.png'
    ),
    Pokemon(
        5045,
        'Pikachu',
        'Electric',
        'Sunny Shore City',
        'assets/pikachu.png'
    ),
    Pokemon(
        3454,
        'Meowth',
        'Normal',
        'Mauville City',
        'assets/meowth.png'
    ),
    Pokemon(
        0294,
        'JigglyPuff',
        'Normal',
        'Violet City',
        'assets/jigglypuff.png'
    ),

  ];
}


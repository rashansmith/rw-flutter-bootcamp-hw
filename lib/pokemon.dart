class Pokemon {
  int number;
  String name;
  String type;
  String caughtLocation;
  String imageUrl;

  Pokemon(
      this.number,
      this.name,
      this.type,
      this.caughtLocation,
      this.imageUrl);


  static List<Pokemon> pokemonList = [
    Pokemon(
        1,
        'Psyduck',
        'Water',
        'Lavender Town',
        'assets/psyduck.png'
    ),
    Pokemon(
        2,
        'Snorlax',
        'Normal',
        'Shalour City',
        'assets/snorlax.png'
    ),
    Pokemon(
        3,
        'Squirtle',
        'Water',
        'Castelia City',
        'assets/squirtle.png'
    ),
    Pokemon(
        4,
        'Pikachu',
        'Electric',
        'Sunny Shore City',
        'assets/pikachu.png'
    ),
    Pokemon(
        5,
        'Meowth',
        'Normal',
        'Mauville City',
        'assets/meowth.png'
    ),
    Pokemon(
        6,
        'JigglyPuff',
        'Normal',
        'Violet City',
        'assets/jigglypuff.png'
    ),

  ];
}


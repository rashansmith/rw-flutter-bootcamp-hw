import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final title = 'Pokedex';
  final imageUrl = 'assets/pokemon_transparent.png';
  final pokemonBlue = Color.fromARGB(255, 57, 75, 215);
  final loginButtonText = 'login';
  final emailLabel = 'Email';
  final passwordLabel = '*********';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 40),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'KosugiMaru',
                    color: Color.fromARGB(255, 57, 75, 215),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 60),
                child: Image(image: AssetImage(imageUrl)),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: emailLabel,
                      hintText: 'Eg. pikachu@gmail.com'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: passwordLabel,
                      hintText: 'Eg. **********'),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.fromLTRB(50, 15, 50, 15)),
                      backgroundColor: MaterialStateProperty.all(pokemonBlue)),
                  child: Text(
                    loginButtonText,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

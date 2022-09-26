import 'package:flutter/material.dart';

enum MessageType  {
  invalidEmail,
  shortPassword,
  passwordReqNotMet,
  emailEmpty,
  passwordEmpty;

}

String getMessageType(MessageType e) {
  switch (e.name) {
    case "invalidEmail":
      return "Invalid Email";
    case "shortPassword":
      return "Short Password";
    case "passwordReqNotMet":
      return "Password Requirements Not Met";
    case "emailEmpty":
      return "Empty email value";
    case "passwordEmpty":
      return "Empty password value";
    default:
      return "";
  }
}


class Login extends StatefulWidget {
  final Widget Function(BuildContext)  w;

  const Login( {
    Key? key,
    required this.w,
  }) : super(key: key);

  @override
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final title = 'Pokedex';
  final imageUrl = 'assets/pokemon_transparent.png';
  final pokemonBlue = const Color.fromARGB(255, 57, 75, 215);
  final loginButtonText = 'Login';
  final emailLabel = 'Email';
  final passwordLabel = 'Password';
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
         child: loginForm(widget.w)
      ),
    );
  }

  Widget loginForm(Widget Function(BuildContext) w) {
    return Form(
      key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 40),
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
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 60),
              child: Image(image: AssetImage(imageUrl)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: emailLabel,
                hintText: 'Eg. pikachu@gmail.com'),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    String err = getMessageType(MessageType.emailEmpty);
                    return 'Error:  $err';
                  } else if(!validEmail(value)) {
                    String err = getMessageType(MessageType.invalidEmail);
                    return 'Error:  $err';
                  }
                  return null;
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: passwordLabel,
                hintText: 'Eg. **********'),
                obscureText: true,
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      String err = getMessageType(MessageType.passwordEmpty);
                      return 'Error:  $err';
                    } else if(!validPassword(value)) {
                      String err = getMessageType(MessageType.passwordReqNotMet);
                      return 'Error:  $err';
                    } else if(value.length < 5) {
                      String err = getMessageType(MessageType.shortPassword);
                      return 'Error:  $err';
                    }
                    return null;
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) {
                  //         return widget.w(context);
                  //       },
                  //     ),
                  //   );
                  // }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return widget.w(context);
                      },
                    ),
                  );
                },
                style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.fromLTRB(50, 15, 50, 15)),
                backgroundColor: MaterialStateProperty.all(pokemonBlue)),
                child: Text(
                  loginButtonText,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  bool validEmail(String value) {
    String emailPattern = r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$';
    RegExp regEx = RegExp(emailPattern);
    if( regEx.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  bool validPassword(String value) {
    String passwordPattern = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{6,}$';
    RegExp regEx = RegExp(passwordPattern);
    if(regEx.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }
}


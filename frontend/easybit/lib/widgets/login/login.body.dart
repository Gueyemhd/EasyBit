import 'package:easybit/constants.dart';
import 'package:easybit/screens/registrationpage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_pw_validator/flutter_pw_validator.dart';
//import 'package:validation_textformfield/validation_textformfield.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _LoginBodyState extends State<LoginBody> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provides us total height and width of our screen
    Widget manageUsername() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 7),
            width: size.width * 0.8,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2))
                ],
                border: Border.all(color: bluelogo, width: 3)),
            height: 50,
            child: TextFormField(
              // The validator receives the text that the user has entered
              controller: myController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entre votre nom d\'utilisateur';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              onChanged: (String value) {},
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(Icons.person, color: bluelogo),
                  hintText: 'Nom d\'utilisateur',
                  hintStyle: TextStyle(color: bluelogo, fontSize: 12)),
            ),
          ),
        ],
      );
    }

    Widget managePassword() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 7),
            width: size.width * 0.8,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: bluelogo, width: 3)),
            height: 50,
            child: TextFormField(
              // The validator receives the password that the user has entered.
              controller: myController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre mot de passe';
                }
                return null;
              },
              onChanged: (String value) {},
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: bluelogo),
                hintText: 'Mot de passe',
                hintStyle: TextStyle(
                  color: bluelogo,
                  fontSize: 12,
                ),
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: bluelogo,
                ),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      );
    }

    Widget manageForgotPasswordBtn() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 1),
        //margin: Empty space to surround the [decoration] and [child].
        width: size.width * 0.9,
        alignment: Alignment.bottomRight,
        child: TextButton(
          onPressed: () => print("Forgot password pressed"),
          child: const Text(
            'Mot de passe oublié?',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      );
    }

    Widget manageLoginBtn() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.7,
        height: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: Container(
              decoration: BoxDecoration(
                  color: bluelogo, //container color
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: gold, width: 2)),
              child: TextButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Succès')),
                    );
                  }
                },
                child: const Text(
                  "Se connecter",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              )),
        ),
      );
    }

    Widget checkSignInBtn() {
      return GestureDetector(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Registration())),
        child: RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: "N'avez vous pas encore de compte?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
            TextSpan(
                text: "  S'inscrire",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold))
          ]),
        ),
      );
    }

    // Build a Form widget using the _formKey created above.
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        //The amount of space by which to inset(insert) the child.
        child: Form(
          key: _formKey,
          child: Center(
            child: SizedBox(
              height: size.height,
              width: double.infinity,
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: -140,
                      left: -100,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 2,
                        width: MediaQuery.of(context).size.width * 2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/background.png"),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Color.fromARGB(235, 5, 111, 198)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 95,
                      top: 170,
                      child: Container(
                        height: 220,
                        width: 220,
                        alignment: Alignment.bottomCenter,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/logo.png"),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 30,
                      bottom: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Add TextFormFields and Button here.
                          manageUsername(),
                          managePassword(),
                          manageForgotPasswordBtn(),
                          manageLoginBtn(),
                          checkSignInBtn(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

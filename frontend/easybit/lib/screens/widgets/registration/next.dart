import 'package:easybit/models/user_model.dart';
import 'package:easybit/screens/pages/loginPage.dart';
import 'package:easybit/screens/pages/registrationpage.dart';
import 'package:easybit/services/user_service.dart';
import 'package:easybit/shared/constants.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class Next extends StatefulWidget {
  const Next({super.key});

  @override
  State<Next> createState() => _NextState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _NextState extends State<Next> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.

  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  // Create a text controller and use it to retrieve the current values of TextFields

  // Map<String, dynamic>? args = {};

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // final validatorFirstName = GlobalKey<FormState>();

  String path = "/http:127.0.0.1:8000/registration";

  void sendCreateAccountDataToServer(Map userData, String path) {
    var responseRequest = http.post(Uri.parse(path), body: userData);
  }

  /* @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    // we fetch data from the first page registration
    // args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // print("=============arguments!==================");
    // print(args);

    Size size = MediaQuery.of(context).size;
    //This size provides us total height and width of our screen

    Widget manageEmail() {
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
            height: 60,
            child: TextFormField(
              controller: emailController,
              // The validator receives the password that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre email';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: bluelogo),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: bluelogo,
                  fontSize: 12,
                ),
                border: InputBorder.none,
              ),
            ),
          )
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
            height: 60,
            child: TextFormField(
              controller: passwordController,
              // The validator receives the password that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre mot de passe';
                }
                return null;
              },
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

    Widget manageConfirmPassword() {
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
            height: 60,
            child: TextFormField(
              controller: confirmPasswordController,
              // The validator receives the password that the user has entered.
              //   controller: myController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer à nouveau votre mot de passe';
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: bluelogo),
                hintText: 'Confirmer mot de passe',
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

    Widget previous() {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.25,
          //  alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
              color: bluelogo,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: gold, width: 3)),
          height: 35,
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Registration())),
            style: ElevatedButton.styleFrom(
              backgroundColor: bluelogo,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              textStyle: const TextStyle(
                  color: gold, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            child: const Text('Précedent ',
                style: TextStyle(color: gold, fontSize: 13)),
          ));
    }

    Widget manageRegistrationBtn() {
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
                onPressed: () async {
                  LocalStorage storage = LocalStorage('first_page_information');
                  UserInformation user = UserInformation(
                    prenom: storage.getItem('prenom'),
                    nom: storage.getItem('nom'),
                    username: storage.getItem('username'),
                    adresseMail: emailController.text,
                    motDePasse: passwordController.text,
                    confirmation: confirmPasswordController.text,
                  );
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar.
                    Map response = await UserService().registration(user);
                    if (response['error'] == false) {
                      storage.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 15.0),
                              "${response['error_message']}",
                            )),
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Login()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 15.0),
                              "${response['error_message']}",
                            )),
                      );
                    }
                  }
                },
                child: const Text(
                  "S'inscrire",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              )),
        ),
      );
    }

    // Build a Form widget using the _formKey created above

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
                            top: -190,
                            left: -200,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 2,
                              width: MediaQuery.of(context).size.width * 2,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.white, bluelogo],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: bluelogo,
                                    offset: Offset(5.0, 5.0),
                                    blurRadius: 10.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
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
                                    Color.fromARGB(232, 10, 76, 130)
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
                              height: 200,
                              width: 200,
                              alignment: Alignment.bottomCenter,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/logo.png"),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 45,
                            bottom: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                manageEmail(),
                                managePassword(),
                                manageConfirmPassword(),
                                const SizedBox(height: 18),
                                previous(),
                                manageRegistrationBtn(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}

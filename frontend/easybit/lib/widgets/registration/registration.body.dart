import 'package:easybit/constants.dart';
import 'package:easybit/models/user_model.dart';
import 'package:easybit/screens/loginPage.dart';
import 'package:easybit/screens/nextPage.dart';
import 'package:easybit/widgets/registration/next.dart';
import 'package:flutter/material.dart';

class RegistrationBody extends StatefulWidget {
  const RegistrationBody({super.key});

  @override
  State<RegistrationBody> createState() => _RegistrationBodyState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _RegistrationBodyState extends State<RegistrationBody> {
  // Map userData = {};
  // User user = User();
//user.name = 'John Doe';

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provides us total height and width of our screen
    Widget manageFirstname() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
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
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre prénom';
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
                  hintText: 'Prénom',
                  hintStyle: TextStyle(color: bluelogo, fontSize: 12)),
            ),
          )
        ],
      );
    }

    Widget manageName() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
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
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre nom';
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
                  hintText: 'Nom',
                  hintStyle: TextStyle(color: bluelogo, fontSize: 12)),
            ),
          )
        ],
      );
    }

    Widget manageUsername() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
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
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entre votre nom d\'utilisateur';
                }
                return null;
              },
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

    Widget checkSignInBtn() {
      return GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Login())),
        child: RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: "Avez vous déjà un compte?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
            TextSpan(
                text: "  Se connecter",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold))
          ]),
        ),
      );
    }

    Widget nextBtn() {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.2,
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: gold, width: 3)),
          height: 35,
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NextPage())),
            style: ElevatedButton.styleFrom(
              backgroundColor: bluelogo,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            child: const Text('Suivant ',
                style: TextStyle(color: gold, fontSize: 13)),
          ));
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
                            right: 50,
                            bottom: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 14),
                                manageFirstname(),
                                manageName(),
                                manageUsername(),
                                checkSignInBtn(),
                                nextBtn(),
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

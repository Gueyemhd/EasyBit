import 'package:easybit/constants.dart';
import 'package:easybit/widgets/registration/next.dart';
import 'package:flutter/material.dart';

class RegistrationBody extends StatefulWidget {
  const RegistrationBody({super.key});

  @override
  State<RegistrationBody> createState() => _RegistrationBodyState();
}

class _RegistrationBodyState extends State<RegistrationBody> {
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
            width: size.width * 0.7,
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
            child: const TextField(
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
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
            width: size.width * 0.7,
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
            child: const TextField(
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
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
            width: size.width * 0.7,
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
            child: const TextField(
              style: TextStyle(
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(Icons.person, color: bluelogo),
                  hintText: 'Nom d\'utilisateur',
                  hintStyle: TextStyle(color: bluelogo, fontSize: 12)),
            ),
          )
        ],
      );
    }

    Widget nextBtn() {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.3,
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
              // color: bluelogo,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: gold, width: 3)),
          height: 35,
          child: ElevatedButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Next())),
            style: ElevatedButton.styleFrom(
              // backgroundColor: bluelogo,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              textStyle: const TextStyle(
                  color: gold, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            child: const Text('Suivant ',
                style: TextStyle(color: gold, fontSize: 13)),
          ));
    }

    return Center(
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
                      colors: [Colors.white, bluelogo],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 150,
                top: 25,
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
                right: 70,
                bottom: 5,
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
    );
  }
}

Widget checkSignInBtn() {
  return GestureDetector(
    onTap: () => print("Sign in pressed"),
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
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))
      ]),
    ),
  );
}

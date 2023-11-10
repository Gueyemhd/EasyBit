import 'package:easybit/constants.dart';
import 'package:flutter/material.dart';

class Next extends StatefulWidget {
  const Next({super.key});

  @override
  State<Next> createState() => _NextState();
}

class _NextState extends State<Next> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provides us total height and width of our screen
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image(
            image: AssetImage("images/logo.png"),
            fit: BoxFit.cover,
            width: 250,
          ),
          SizedBox(height: size.height * 0.11),
          manageEmail(),
          const SizedBox(height: 12),
          managePassword(),
          const SizedBox(height: 12),
          confirmPassword(),
          const SizedBox(height: 12),
          manageSignupBtn(),
        ],
      ),
    );
  }
}

Widget manageEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
            border: Border.all(color: bluelogo, width: 3)),
        height: 60,
        child: const TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.email, color: bluelogo),
              hintText: 'Adresse mail',
              hintStyle: TextStyle(
                color: bluelogo,
                fontSize: 12,
              )),
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
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
            border: Border.all(color: bluelogo, width: 3)),
        height: 60,
        child: const TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(Icons.password, color: bluelogo),
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

Widget confirmPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ],
            border: Border.all(color: bluelogo, width: 3)),
        height: 60,
        child: const TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(Icons.password, color: bluelogo),
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

Widget manageSignupBtn() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      height: 100,
      child: ElevatedButton(
        onPressed: () => print('Signup pressed'),
        child: const Text('S\'inscrire'),
        style: ElevatedButton.styleFrom(
          backgroundColor: bluelogo,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ));
}

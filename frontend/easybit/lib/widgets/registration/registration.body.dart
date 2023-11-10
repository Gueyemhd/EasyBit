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
    Widget nextBtn() {
      return Container(
          padding: const EdgeInsets.symmetric(vertical: 25),
          alignment: Alignment.bottomRight,
          width: double.infinity,
          height: 100,
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
          manageFirstname(),
          const SizedBox(height: 12),
          manageName(),
          const SizedBox(height: 12),
          manageUsername(),
          const SizedBox(height: 8),
          checkSignInBtn(),
          const SizedBox(height: 12),
          nextBtn()
        ],
      ),
    );
  }
}

Widget manageFirstname() {
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

Widget checkSignInBtn() {
  return GestureDetector(
    onTap: () => print("Sign in pressed"),
    child: RichText(
      text: const TextSpan(children: [
        TextSpan(
            text: "Avez vous déjà un compte?",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: "  Se connecter",
            style: TextStyle(
                color: bluelogo, fontSize: 15, fontWeight: FontWeight.bold))
      ]),
    ),
  );
}

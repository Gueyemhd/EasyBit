import 'package:easybit/screens/widgets/profile/profile.body.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(resizeToAvoidBottomInset: true, body: ProfileBody());
  }
}

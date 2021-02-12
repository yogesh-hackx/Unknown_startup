import 'package:application_unknown/screens/home_screen.dart';
import 'package:application_unknown/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Helper extends StatefulWidget {
  @override
  _HelperState createState() => _HelperState();
}

class _HelperState extends State<Helper> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, data) {
                  if (data.hasData) {
                    return HomeScreen();
                  } else {
                    return SignUpScreen();
                  }
                });
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

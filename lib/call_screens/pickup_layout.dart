import 'package:application_unknown/call_screens/pickup_screen.dart';
import 'package:application_unknown/models/call.dart';
import 'package:application_unknown/resources/call_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PickUpLayout extends StatelessWidget {
  final Widget scaffold;
  final String userUid;
  final CallMethods callMethods = CallMethods();

  PickUpLayout({Key key, @required this.scaffold, this.userUid});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: callMethods.callStream(uid: userUid),
      builder: (context, snapShot) {
        if (snapShot.hasData && snapShot.data.data() != null) {
          print(snapShot.data.data());
          Call call = Call.fromMap(snapShot.data.data());
          print(call);
          print("value of has Dialed!! is  ${call.hasDialed}");
          if (!call.hasDialed) {
            return PickUpScreen(call: call);
          }
          return scaffold;
        } else {
          return scaffold;
        }
      },
    );
  }
}

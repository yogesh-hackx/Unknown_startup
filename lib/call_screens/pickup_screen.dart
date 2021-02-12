import 'package:application_unknown/call_screens/call_screen.dart';
import 'package:application_unknown/call_utilities/permissions.dart';
import 'package:application_unknown/models/call.dart';
import 'package:application_unknown/resources/call_methods.dart';
import 'package:flutter/material.dart';

class PickUpScreen extends StatelessWidget {
  final Call call;

  PickUpScreen({Key key, @required this.call});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Incoming....",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 50),
            Text(
              call.callerName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.call_end),
                  color: Colors.redAccent,
                  onPressed: () async {
                    await CallMethods().endCall(call: call);
                  },
                ),
                SizedBox(width: 25),
                IconButton(
                    icon: Icon(Icons.call),
                    color: Colors.green,
                    onPressed: () async {
                      await Permissions.cameraAndMicrophonePermissionsGranted()
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CallScreen(call: call)))
                          : {};
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

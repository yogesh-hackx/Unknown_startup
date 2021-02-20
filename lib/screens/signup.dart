import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final phoneNumberController = TextEditingController();

  final firebaseMethods = FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBar(
          automaticallyImplyLeading: false,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          )),
          backgroundColor: const Color.fromRGBO(28, 30, 33, 1),
          flexibleSpace: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Text("Welcome to",
                      style: Theme.of(context).textTheme.headline2),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Text("Touch",
                      style: Theme.of(context).textTheme.headline1),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(28, 30, 33, 1),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30, top: 40),
            child: Text("Phone Verification",
                style: Theme.of(context).textTheme.headline3),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 40),
            child: Divider(
              color: Colors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 20, right: 30),
            child: Text(
              "A six digit code will be sent to verify your phone number ",
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                color: Colors.white70,
                fontSize: 17,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 10, right: 50),
            width: 320,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white54,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              style: Theme.of(context).textTheme.subtitle1,
              textAlignVertical: TextAlignVertical.center,
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                counterText: '',
                prefixIcon: Icon(
                  Icons.call_rounded,
                  color: Colors.white,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 20, right: 50),
            child: RaisedButton(
              onPressed: () async {
                await firebaseMethods.verifyPhoneNumber(
                    phoneNumberController.text.trim(), context);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              color: Color.fromRGBO(82, 104, 244, 1),
              padding: EdgeInsets.all(18),
              child: Text(
                "Get OTP",
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
    );
  }
}

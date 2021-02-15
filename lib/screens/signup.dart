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
            bottom: Radius.circular(60),
          )),
          flexibleSpace: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(67, 127, 199, 1),
                  Color.fromRGBO(109, 175, 254, 1)
                ],
              ),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Text("Welcome to",
                      style: GoogleFonts.nunito(
                          color: Colors.white70,
                          fontSize: 35,
                          fontWeight: FontWeight.w800)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Text("Touch",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w800)),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30, top: 40),
            child: Text("Phone Verification",
                style: GoogleFonts.nunito(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.w900)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
                "A six digit code will be sent to verify your phone number ",
                style: GoogleFonts.nunito(
                    color: Colors.grey[700],
                    fontSize: 17,
                    fontWeight: FontWeight.w800)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 30),
            child: Text("Phone number:",
                style: GoogleFonts.nunito(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w900)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 10, right: 50),
            width: 320,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(231, 233, 240, 1),
              ),
              borderRadius: BorderRadius.circular(15),
              color: Color.fromRGBO(231, 233, 240, 1),
            ),
            child: TextField(
              style:
                  GoogleFonts.nunito(fontWeight: FontWeight.w800, fontSize: 22),
              textAlignVertical: TextAlignVertical.center,
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                counterText: '',
                prefixIcon: Icon(
                  Icons.call_rounded,
                  color: Color.fromRGBO(67, 127, 199, 1),
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
              color: Theme.of(context).buttonColor,
              textColor: Colors.white,
              padding: EdgeInsets.all(18),
              child: Text(
                "Get OTP",
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(67, 127, 199, 1),
              Color.fromRGBO(109, 175, 254, 1)
            ],
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
    );
  }
}

import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'signup.dart';

class OneTimePassword extends StatefulWidget {
  final String verificationId;

  OneTimePassword(this.verificationId);

  @override
  _OneTimePasswordState createState() => _OneTimePasswordState();
}

class _OneTimePasswordState extends State<OneTimePassword> {
  final TextEditingController otp1 = TextEditingController();
  final TextEditingController otp2 = TextEditingController();
  final TextEditingController otp3 = TextEditingController();
  final TextEditingController otp4 = TextEditingController();
  final TextEditingController otp5 = TextEditingController();
  final TextEditingController otp6 = TextEditingController();

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
              color: Colors.indigo[600],
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
            child: Text("Verification Code",
                style: GoogleFonts.nunito(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.w900)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 20),
            child: Text("Enter the six digit code sent to ",
                style: GoogleFonts.nunito(
                    color: Colors.grey[700],
                    fontSize: 17,
                    fontWeight: FontWeight.w800)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 5),
            child: Text("9919937915",
                style: GoogleFonts.nunito(
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontWeight: FontWeight.w900)),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  width: 50,
                  margin: EdgeInsets.only(left: 30, top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey[500]),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 28,
                    controller: otp1,
                    maxLength: 1,
                    style: GoogleFonts.nunito(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  margin: EdgeInsets.only(left: 10, top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey[500]),
                  ),
                  child: TextField(
                    controller: otp2,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 28,
                    maxLength: 1,
                    style: GoogleFonts.nunito(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  margin: EdgeInsets.only(left: 10, top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey[500]),
                  ),
                  child: TextField(
                    controller: otp3,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 28,
                    maxLength: 1,
                    style: GoogleFonts.nunito(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  margin: EdgeInsets.only(left: 10, top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey[500]),
                  ),
                  child: TextField(
                    controller: otp4,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 28,
                    maxLength: 1,
                    style: GoogleFonts.nunito(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  margin: EdgeInsets.only(left: 10, top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey[500]),
                  ),
                  child: TextField(
                    controller: otp5,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 28,
                    maxLength: 1,
                    style: GoogleFonts.nunito(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  margin: EdgeInsets.only(left: 10, top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey[500]),
                  ),
                  child: TextField(
                    controller: otp6,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 28,
                    maxLength: 1,
                    style: GoogleFonts.nunito(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      counterText: "",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 20, right: 45),
            child: RaisedButton(
              onPressed: () async {
                String fullOpt = otp1.text +
                    otp2.text +
                    otp3.text +
                    otp4.text +
                    otp5.text +
                    otp6.text;
                await FirebaseMethods()
                    .verifyOtp(widget.verificationId, fullOpt.trim(), context);
              },
              color: Colors.indigo[700],
              textColor: Colors.white,
              padding: EdgeInsets.all(12),
              child: Text(
                "Verify",
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(11),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                ),
                margin: const EdgeInsets.only(left: 30, top: 40),
                child: Text(
                  "Resend OTP",
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(11),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                ),
                margin: const EdgeInsets.only(left: 30, top: 40, right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                    }));
                  },
                  child: Text(
                    "Wrong Number?",
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.indigo[600],
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
    );
  }
}

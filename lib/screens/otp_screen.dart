import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:flutter/material.dart';
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
              color: Color.fromRGBO(23, 28, 41, 1),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
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
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30, top: 40),
            child: Text("Verification Code",
                style: Theme.of(context).textTheme.headline3),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 20),
            child: Text("Enter the six digit code sent to ",
                style: Theme.of(context).textTheme.headline4),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 5),
            child: Text("9919937915",
                style: Theme.of(context).textTheme.subtitle1),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  width: 50,
                  margin: EdgeInsets.only(left: 30, top: 30),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(53, 61, 81, 1),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromRGBO(53, 61, 81, 1),
                    ),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 28,
                    controller: otp1,
                    maxLength: 1,
                    style: Theme.of(context).textTheme.headline3,
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
                    color: Color.fromRGBO(53, 61, 81, 1),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromRGBO(53, 61, 81, 1),
                    ),
                  ),
                  child: TextField(
                    controller: otp2,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 28,
                    maxLength: 1,
                    style: Theme.of(context).textTheme.headline3,
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
                    color: Color.fromRGBO(53, 61, 81, 1),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromRGBO(53, 61, 81, 1),
                    ),
                  ),
                  child: TextField(
                    controller: otp3,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 28,
                    maxLength: 1,
                    style: Theme.of(context).textTheme.headline3,
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
                    color: Color.fromRGBO(53, 61, 81, 1),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromRGBO(53, 61, 81, 1),
                    ),
                  ),
                  child: TextField(
                    controller: otp4,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 28,
                    maxLength: 1,
                    style: Theme.of(context).textTheme.headline3,
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
                    color: Color.fromRGBO(53, 61, 81, 1),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromRGBO(53, 61, 81, 1),
                    ),
                  ),
                  child: TextField(
                    controller: otp5,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 28,
                    maxLength: 1,
                    style: Theme.of(context).textTheme.headline3,
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
                    color: Color.fromRGBO(53, 61, 81, 1),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromRGBO(53, 61, 81, 1),
                    ),
                  ),
                  child: TextField(
                    controller: otp6,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    cursorHeight: 28,
                    maxLength: 1,
                    style: Theme.of(context).textTheme.headline3,
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
              color: Color.fromRGBO(109, 175, 254, 1),
              textColor: Colors.white,
              padding: EdgeInsets.all(18),
              child: Text(
                "Verify",
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(53, 61, 81, 1),
                ),
                margin: const EdgeInsets.only(left: 30, top: 40),
                child: Text("Resend OTP",
                    style: Theme.of(context).textTheme.headline4),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(53, 61, 81, 1),
                ),
                margin: const EdgeInsets.only(left: 30, top: 40, right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                    }));
                  },
                  child: Text("Wrong Number?",
                      style: Theme.of(context).textTheme.headline4),
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromRGBO(23, 28, 41, 1),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
    );
  }
}

import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final TextEditingController username = TextEditingController();
  final TextEditingController bio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          titleSpacing: 30,
          elevation: 0,
          title: Text(
            "Your Details",
            style: GoogleFonts.ubuntu(
                color: Colors.grey[700],
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(30),
              child: Text(
                "Tell us about yourself :)",
                style: GoogleFonts.nunito(
                    fontSize: 25,
                    color: Colors.indigo[900],
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage(
                      "assets/images/portrait-657116_1920.jpg"),
                  radius: 100.0,
                ),
                Positioned(
                  child: Badge(
                    badgeContent: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 28,
                    ),
                    badgeColor: Colors.indigoAccent[700],
                  ),
                  bottom: 10,
                  right: 20,
                )
              ],
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey[300]),
              ),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 20),
              width: 300,
              child: TextField(
                controller: username,
                keyboardType: TextInputType.phone,
                cursorHeight: 20,
                decoration: InputDecoration(
                  hintText: "Your name here..",
                  border: InputBorder.none,
                  counterText: "",
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.indigoAccent[700],
                  ),
                  hintStyle: GoogleFonts.nunito(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey[300]),
              ),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 20),
              width: 300,
              child: TextField(
                controller: bio,
                keyboardType: TextInputType.phone,
                cursorHeight: 20,
                decoration: InputDecoration(
                  enabled: true,
                  hintText: "Your about here..",
                  border: InputBorder.none,
                  counterText: "",
                  prefixIcon: Icon(
                    Icons.info_outline,
                    color: Colors.indigoAccent[700],
                  ),
                  hintStyle: GoogleFonts.nunito(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey[300]),
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(top: 20),
              width: 300,
              child: TextField(
                keyboardType: TextInputType.phone,
                cursorHeight: 20,
                decoration: InputDecoration(
                  enabled: true,
                  hintText: "Your speciality here..",
                  border: InputBorder.none,
                  counterText: "",
                  prefixIcon: Icon(
                    Icons.info_outline,
                    color: Colors.indigoAccent[700],
                  ),
                  hintStyle: GoogleFonts.nunito(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              child: RaisedButton(
                onPressed: () {
                  FirebaseMethods().updateUserDetail(
                      username.text.trim(), bio.text.trim(), context);
                },
                color: Colors.indigo[400],
                textColor: Colors.white,
                padding: EdgeInsets.all(12),
                child: Text(
                  "Next",
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

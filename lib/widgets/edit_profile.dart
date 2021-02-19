import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          titleSpacing: 30,
          elevation: 0,
          title: Text(
            "Edit Profile",
            style: GoogleFonts.nunito(
                color: Colors.grey[600],
                fontSize: 23,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(),
              margin: EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 90,
                    backgroundImage: const AssetImage(
                        "assets/images/pexels-sindre-strøm-1040880.jpg"),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 5,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(67, 127, 199, 1),
                            Color.fromRGBO(109, 175, 254, 1)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 20),
            child: Text("Your Name:",
                style: GoogleFonts.nunito(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w900)),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(231, 233, 240, 1),
                ),
                borderRadius: BorderRadius.circular(3),
                color: Color.fromRGBO(231, 233, 240, 1),
              ),
              child: TextField(
                style: GoogleFonts.nunito(fontSize: 20),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 20),
            child: Text("Your About:",
                style: GoogleFonts.nunito(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w900)),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(231, 233, 240, 1),
                ),
                borderRadius: BorderRadius.circular(3),
                color: Color.fromRGBO(231, 233, 240, 1),
              ),
              child: TextField(
                style: GoogleFonts.nunito(fontSize: 20),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 20),
            child: Text("Your Speciality:",
                style: GoogleFonts.nunito(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w900)),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(231, 233, 240, 1),
                ),
                borderRadius: BorderRadius.circular(3),
                color: Color.fromRGBO(231, 233, 240, 1),
              ),
              child: TextField(
                style: GoogleFonts.nunito(fontSize: 20),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: RaisedButton(
              onPressed: () async {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              color: Color.fromRGBO(109, 175, 254, 1),
              textColor: Colors.white,
              padding: EdgeInsets.all(18),
              child: Text(
                "Save Changes",
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

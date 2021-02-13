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
          backgroundColor: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(),
              margin: EdgeInsets.only(top: 30),
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
                        color: Colors.cyan,
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
          Center(
            child: Container(
              margin: EdgeInsets.all(30),
              child: TextField(
                style: GoogleFonts.nunito(),
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Edit name",
                  labelStyle: GoogleFonts.nunito(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(30),
              child: TextField(
                style: GoogleFonts.nunito(),
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Edit about",
                  labelStyle: GoogleFonts.nunito(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(30),
              child: TextField(
                style: GoogleFonts.nunito(),
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Edit speciality",
                  labelStyle: GoogleFonts.nunito(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: RaisedButton(
              onPressed: () async {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              color: Colors.indigo[700],
              textColor: Colors.white,
              padding: EdgeInsets.all(12),
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

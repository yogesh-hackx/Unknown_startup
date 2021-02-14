import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 30,
          elevation: 0,
          title: Text(
            "Status",
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
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(-6.0, -6.0),
                  blurRadius: 16.0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      border: Border.all(
                          color: Color.fromRGBO(231, 233, 240, 1), width: 3)),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: const AssetImage(
                        "assets/images/pexels-sindre-strøm-1040880.jpg"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Your Status",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Colors.black87),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(67, 127, 199, 1),
                                  Color.fromRGBO(109, 175, 254, 1)
                                ],
                              ),
                            ),
                            child: Icon(
                              Icons.create_rounded,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              " Add Text",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(67, 127, 199, 1),
                                  Color.fromRGBO(109, 175, 254, 1)
                                ],
                              ),
                            ),
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "Add Media",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  color: Colors.black87),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ListTile(
              tileColor: Colors.white,
              contentPadding: EdgeInsets.all(5),
              leading: Container(
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: const AssetImage(
                      "assets/images/pexels-sindre-strøm-1040880.jpg"),
                ),
              ),
              title: Text(
                "Jennifer Cleo",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: Colors.black87),
              ),
              subtitle: Text(
                "Yesterday at 12:30pm",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              tileColor: Colors.white,
              contentPadding: const EdgeInsets.all(5),
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: const AssetImage(
                    "assets/images/pexels-sindre-strøm-1040880.jpg"),
              ),
              title: Text(
                "Jennifer Cleo",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: Colors.black87),
              ),
              subtitle: Text(
                "Yesterday at 12:30pm",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}

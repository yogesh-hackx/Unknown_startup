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
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(color: Colors.indigo, width: 3)),
                    child: const CircleAvatar(
                      radius: 70,
                      backgroundImage: const AssetImage(
                          "assets/images/pexels-sindre-strøm-1040880.jpg"),
                    ),
                  ),
                ),
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

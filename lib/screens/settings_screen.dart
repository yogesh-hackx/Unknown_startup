import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
            "Settings",
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
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Container(
                    child: Text("Themes available",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.black87)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(color: Colors.blue, width: 3)),
                        child: const CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(color: Colors.indigo, width: 3)),
                        child: const CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.indigo,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(color: Colors.red, width: 3)),
                        child: const CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.red,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            border:
                                Border.all(color: Colors.deepPurple, width: 3)),
                        child: const CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.deepPurple,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(color: Colors.cyan, width: 3)),
                        child: const CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.cyan,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text("Dark mode",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.black87)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      border: Border.all(color: Colors.black87, width: 3)),
                  child: const CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.black87,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

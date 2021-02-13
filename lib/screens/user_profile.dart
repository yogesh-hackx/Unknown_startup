import 'package:application_unknown/call_utilities/call_utilities.dart';
import 'package:application_unknown/call_utilities/permissions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatefulWidget {
  final String currentUserUid;
  final String profileUserUid;
  final String currentUserName;
  final String profileUserName;

  UserProfile(
      {Key key,
      this.currentUserUid,
      this.currentUserName,
      this.profileUserUid,
      this.profileUserName});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          titleSpacing: 30,
          iconTheme: IconThemeData(color: Colors.black54),
          elevation: 0,
          title: Text(
            "Mark's Profile",
            style: GoogleFonts.nunito(
                color: Colors.grey[600],
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),
          backgroundColor: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(30),
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
                        border:
                            Border.all(color: Colors.indigo[300], width: 4)),
                    child: const CircleAvatar(
                      radius: 75,
                      backgroundImage: const AssetImage(
                          "assets/images/pexels-sindre-strøm-1040880.jpg"),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text("Mark Spencer",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.black87)),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 2),
                    child: Text(
                      "&UX/UI Developer",
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text(
                      "Existential Crisis",
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w900,
                          fontSize: 17,
                          color: Colors.black54),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30, right: 30, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.teal[200],
                              ),
                              child: Icon(
                                Icons.chat_bubble,
                                color: Colors.teal[700],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Message",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.orange[200],
                              ),
                              child: Icon(
                                Icons.call,
                                color: Colors.orange[700],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Voice Call",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Permissions
                                  .cameraAndMicrophonePermissionsGranted()
                              ? CallUtilies.dial(
                                  fromUid: widget.currentUserUid,
                                  fromName: widget.currentUserName,
                                  toUid: widget.profileUserUid,
                                  toName: widget.profileUserName,
                                  context: context)
                              : {};
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000),
                                  color: Colors.deepPurple[200],
                                ),
                                child: Icon(
                                  Icons.videocam_rounded,
                                  color: Colors.deepPurple[700],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "Video Call",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(10),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "More Options",
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.amber[200],
                              ),
                              child: Icon(
                                Icons.share_rounded,
                                color: Colors.amber[700],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Media Shared",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.cyan[200],
                              ),
                              child: Icon(
                                Icons.volume_off_rounded,
                                color: Colors.cyan[700],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Mute",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.red[200],
                              ),
                              child: Icon(
                                Icons.block_rounded,
                                color: Colors.red[700],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Block",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: Colors.pink[200],
                              ),
                              child: Icon(
                                Icons.thumb_down_rounded,
                                color: Colors.pink[700],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Report",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

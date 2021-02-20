import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';

class TextStatus extends StatefulWidget {
  @override
  _TextStatusState createState() => _TextStatusState();
}

class _TextStatusState extends State<TextStatus> {
  final _auth = FirebaseMethods().auth;
  FocusNode focusNode = FocusNode();

  addStatus() async {
    focusNode.unfocus();
    final statusTime = DateTime.now();
    Toast.show("Sending...",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
    final statusInfoMap = {
      "caption": textStatus.text.trim(),
      "media": "",
      "duration": "4",
      "mediaType": "text",
      "when": statusTime,
      "color": "#303f9f"
    };

    Navigator.pop(context);

    DocumentReference ref = await FirebaseMethods()
        .createStatus(_auth.currentUser.uid, statusInfoMap);
    QuerySnapshot querySnapshot =
        await FirebaseMethods().getStatus(_auth.currentUser.uid);

    

    int numberOfStatus = querySnapshot.size;

    final lastStatusUpdateMap = {
      "lastStatusTime": statusTime,
      "lastStatusType": "text",
      "numberOfStatus": numberOfStatus,
    };

    return FirebaseMethods()
        .updateLastStatus(_auth.currentUser.uid, lastStatusUpdateMap);
  }

  TextEditingController textStatus = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          titleSpacing: 30,
          elevation: 0,
          title: Text(
            "Your Status",
            style: GoogleFonts.nunito(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.black.withOpacity(0.1),
        ),
      ),
      backgroundColor: Colors.blue,
      body: Container(
        margin: EdgeInsets.all(30),
        child: Center(
          child: TextField(
            focusNode: focusNode,
            controller: textStatus,
            style: GoogleFonts.nunito(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            cursorColor: Colors.white,
            cursorHeight: 40,
            maxLength: 224,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            //decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        color: Colors.black.withOpacity(0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Icon(
                Icons.emoji_emotions_rounded,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: 20),
                padding: const EdgeInsets.all(15),
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
                  Icons.send,
                  color: Colors.white,
                ),
              ),
              onTap: () async {
                await addStatus();
              },
            ),
          ],
        ),
      ),
    );
  }
}

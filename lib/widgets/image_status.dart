import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:toast/toast.dart';

class ImageStatus extends StatefulWidget {
  final File file;

  ImageStatus({Key key, this.file});
  @override
  _ImageStatusState createState() => _ImageStatusState();
}

class _ImageStatusState extends State<ImageStatus> {
  TextEditingController imageStatusController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final _auth = FirebaseMethods().auth;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text("Sending!"),
      ],
    ),
  );

  uploadImageStatus(BuildContext context) async {
    focusNode.unfocus();
    final statusTime = DateTime.now();
    Toast.show("Sending...",context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);
    String fileName = basename(widget.file.path);

    firebase_storage.TaskSnapshot uploadTask = await storage
        .ref("status" + _auth.currentUser.uid + "/$fileName")
        .putFile(widget.file);
    String url = await uploadTask.ref.getDownloadURL();

    final statusInfoMap = {
      "caption": imageStatusController.text.trim(),
      "media": url,
      "duration": "4",
      "mediaType": "image",
      "when": statusTime,
      "color": "#303f9f"
    };

    DocumentReference ref = await FirebaseMethods()
        .createStatus(_auth.currentUser.uid, statusInfoMap);
    QuerySnapshot querySnapshot =
        await FirebaseMethods().getStatus(_auth.currentUser.uid);

    int numberOfStatus = querySnapshot.size;

    final lastStatusUpdateMap = {
      "lastStatusTime": statusTime,
      "lastStatusType": "image",
      "numberOfStatus": numberOfStatus,
      "imageUrl": url
    };

    return FirebaseMethods()
        .updateLastStatus(_auth.currentUser.uid, lastStatusUpdateMap);
  }

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
                color: Colors.white70,
                fontSize: 25,
                fontWeight: FontWeight.w900),
          ),
          backgroundColor: Colors.black87,
        ),
      ),
      body: Center(
        child: Container(
          child: Image(
            image: FileImage(widget.file),
          ),
        ),
      ),
      backgroundColor: Colors.black87,
      bottomNavigationBar: SizedBox(
        child: Container(
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, bottom: 15, top: 5),
                    width: 330,
                    padding: const EdgeInsets.all(4),
                    child: TextField(
                      focusNode: focusNode,
                      controller: imageStatusController,
                      textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        prefixIcon: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.emoji_emotions_rounded,
                            color: Colors.white,
                          ),
                        ),
                        hintText: "Add caption",
                        hintStyle: GoogleFonts.nunito(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white70),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 10, bottom: 15, top: 5),
                      padding: const EdgeInsets.all(13),
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
                      await uploadImageStatus(context);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

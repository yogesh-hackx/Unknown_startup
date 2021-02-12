import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';

import '../firebase/FirebaseMethods.dart';

class Document extends StatefulWidget {
  final String fileName;
  final String chatRoomId;
  final String downloadUrl;
  final String senderUid;
  final String path;
  Document({Key key, this.fileName, this.chatRoomId, this.downloadUrl,this.senderUid,this.path});

  @override
  _DocumentState createState() => _DocumentState();
}

class _DocumentState extends State<Document> {

  FirebaseAuth _auth = FirebaseMethods().auth;
  downloadFileExample() async {
    final status = await Permission.storage.request();
    print(status);
    if (status.isGranted) {
      final externalDirectory = await getExternalStorageDirectory();
      final id = await FlutterDownloader.enqueue(
          url: widget.downloadUrl,
          savedDir: externalDirectory.path,
          fileName: widget.fileName,
          showNotification: true,
          openFileFromNotification: true);
    }
  }

  openFile(){
    OpenFile.open(widget.path);
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              offset: Offset(-6.0, -6.0),
              blurRadius: 16.0,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(6.0, 6.0),
              blurRadius: 16.0,
            ),
          ],
          border: Border.all(color: Colors.grey[200]),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              child: Icon(
                Icons.description_rounded,
                color: Colors.indigo,
                size: 40,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    widget.fileName,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "2.3mb",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w800,
                      color: Colors.indigo[800],
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: InkWell(
                onTap:  _auth.currentUser.uid == widget.senderUid ? openFile:downloadFileExample,
                child: Icon(
                  _auth.currentUser.uid == widget.senderUid ? Icons.folder_open:Icons.arrow_circle_down,
                  color: Colors.indigo[700],
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:io';
import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ImageUploading extends StatefulWidget {
  final String path;
  final String senderUid;
  final String fileName;
  final String chatRoomId;
  final String uid;

  ImageUploading(
      {Key key,
      this.path,
      this.senderUid,
      this.fileName,
      this.chatRoomId,
      this.uid});

  @override
  _ImageUploadingState createState() => _ImageUploadingState();
}

class _ImageUploadingState extends State<ImageUploading> {
  FirebaseAuth auth = FirebaseMethods().auth;

  bool isPause = false;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  double _progress;

  StreamSubscription<firebase_storage.TaskSnapshot> uploading;
  UploadTask uploadTask;

  cancelUpload() {
    uploadTask.pause();
    setState(() {
      isPause = true;
    });
  }

  retryUpload() {
    setState(() {
      isPause = false;
    });
    uploadTask.resume();
  }

  streamUpload(TaskSnapshot event) {
    setState(() {
      _progress =
          event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
    });
  }

  uploadingDone(
      Reference imageRef, DateTime lastMessageTs, File imageFile) async {
    String url = await imageRef.getDownloadURL();
    String path = imageFile.path;

    Map<String, dynamic> messageInfoMap = {
      "message": "image",
      "sentBy": auth.currentUser.uid,
      "DateTime": lastMessageTs,
      "isSeen": false,
      "receiverId": widget.senderUid,
      "type": "image",
      "downloadUrl": url,
      "fileName": widget.fileName,
      "path": path,
      "isUploading": false
    };

    FirebaseMethods()
        .sendFinalAttachMentMessage(
            widget.chatRoomId, widget.uid, messageInfoMap)
        .then((value) {
      Map<String, dynamic> lastMessageInfoMap = {
        "lastMessage": "image",
        "lastMessageSendTimeDate": lastMessageTs,
        "lastMessageSendBy": auth.currentUser.uid,
        "chatRoomId": widget.chatRoomId,
        "messageId": value
      };

      FirebaseMethods()
          .updateLastMessageSent(widget.chatRoomId, lastMessageInfoMap);
    });
  }

  upload() async {
    DateTime lastMessageTs = DateTime.now();
    File imageFile = File(widget.path);

    firebase_storage.Reference imageRef =
        storage.ref(widget.chatRoomId + "/" + widget.fileName);

    setState(() {
      uploadTask = imageRef.putFile(imageFile);
    });

    uploading = uploadTask.asStream().listen((event) {
      streamUpload(event);
    }, onDone: () {
      uploadingDone(imageRef, lastMessageTs, imageFile);
    });
  }

  @override
  void initState() {
    upload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 220, maxHeight: 230),
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey[400]),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image(
                  image: FileImage(File(widget.path)),
                  fit: BoxFit.cover,
                ),
              ),
              isPause
                  ? GestureDetector(
                      onTap: () {
                        retryUpload();
                      },
                      child: Container(
                        child: Icon(Icons.upload_file),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        cancelUpload();
                      },
                      child: Container(
                        child: Icon(Icons.pause),
                      ),
                    ),
              CircularProgressIndicator(
                value: _progress,
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5, top: 5, left: 3),
          child: Text(
            "10:30pm",
            style: GoogleFonts.nunito(
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

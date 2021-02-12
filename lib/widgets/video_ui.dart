import 'dart:io';

import 'package:application_unknown/screens/video_viewer.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class Video extends StatefulWidget {
  final String url;
  final String fileName;
  final String senderUid;

  Video({Key key, this.url, this.fileName, this.senderUid});

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  String filePath;
  double aspectRatio;

  getThumnail() async {
    String filepath = await VideoThumbnail.thumbnailFile(
        video: widget.url,
        thumbnailPath: (await getTemporaryDirectory()).path,
        maxHeight: 250,
        quality: 75);

    File file = File(filepath);
    var decodedImage = await decodeImageFromList(file.readAsBytesSync());

    double aspectratio = decodedImage.width / decodedImage.height;

    setState(() {
      filePath = filepath;
      aspectRatio = aspectratio;
    });
  }

  FirebaseAuth _auth = FirebaseMethods().auth;
  @override
  @override
  void initState() {
    super.initState();
    getThumnail();
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: _auth.currentUser.uid == widget.senderUid
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return VideoViewer(
                url: widget.url,
                fileName: widget.fileName,
                aspectRatio: aspectRatio,
              );
            }));
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 190,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(4),
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
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.amber[400],
                ),
                child: ClipRRect(
                    child: filePath == null
                        ? Image.asset("assets/images/videoLoadingError.jpg")
                        : Image.file(File(filePath))),
              ),
              Positioned(
                child: Container(
                  child: Icon(
                    Icons.play_circle_fill_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

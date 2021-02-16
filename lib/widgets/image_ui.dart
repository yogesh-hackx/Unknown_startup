import 'dart:io';
import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:application_unknown/screens/image_viewer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Images extends StatefulWidget {
  final String path;
  final String url;
  final String senderUid;
  final String fileName;

  Images({Key key, this.path, this.url, this.senderUid, this.fileName});

  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  FirebaseAuth auth = FirebaseMethods().auth;

  String filePath;

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }

  checkIfExistsAndDownload() async {
    //print(widget.url);
    var tempFile = await getExternalStorageDirectory();
    print(tempFile.path + "/${widget.fileName}");
    String imagePath = tempFile.path + "/${widget.fileName}";
    if (await File(imagePath).exists()) {
      print("Exists!!!");
      setState(() {
        filePath = imagePath;
      });
      return;
    } else {
      String id = await FlutterDownloader.enqueue(
          url: widget.url, savedDir: tempFile.path, fileName: widget.fileName);
      final result = await ImageGallerySaver.saveFile(
          tempFile.path + "/${widget.fileName}");
      print(result);
    }
  }

  @override
  void initState() {
    super.initState();
    _requestPermission();
    if (auth.currentUser.uid != widget.senderUid) {
      checkIfExistsAndDownload();
    }
  }

  openImageViewer(BuildContext context) {
    print(widget.path);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ImageViewer(
        path: widget.path,
        url: widget.url,
        mine: auth.currentUser.uid == widget.senderUid,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openImageViewer(context);
      },
      child: CachedNetworkImage(
          imageUrl: widget.url,
          imageBuilder: (context, imageProvider) {
            return Row(
              mainAxisAlignment: auth.currentUser.uid == widget.senderUid
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 220, maxHeight: 230),
                  padding: EdgeInsets.all(4),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[400]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(fit: BoxFit.cover, image: imageProvider)),
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
          }),
    );
  }
}

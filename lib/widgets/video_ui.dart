import 'dart:io';

import 'package:application_unknown/screens/video_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class Video extends StatefulWidget {
  final String url;
  final String fileName;
  final String senderUid;
  final String path;

  Video({Key key, this.url, this.fileName, this.senderUid,this.path});

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  String filePath;
  double aspectRatio;
  bool isDownloading= false;

  FirebaseAuth auth = FirebaseMethods().auth;

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
    if (await File(widget.path).exists()) {
      print("exists!!");
      await getThumnail(widget.path);
      return;
    } else {
      setState(() {
        isDownloading = true;
      });
      String id = await FlutterDownloader.enqueue(
          url: widget.url, savedDir: tempFile.path, fileName: widget.fileName);
      final result = await ImageGallerySaver.saveFile(
          tempFile.path + "/${widget.fileName}");
      print(result);
      setState(() {
        isDownloading = false;
      });
      await getThumnail(tempFile.path + "/${widget.fileName}");
      }
  }

  @override
  void initState() {
    super.initState();
    _requestPermission();
    if (auth.currentUser.uid != widget.senderUid) {
      checkIfExistsAndDownload();
    }
    else{
      getThumnail(widget.path);
    }
  }

  getThumnail(String path) async {
    String filepath = await VideoThumbnail.thumbnailFile(
        video: path,
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

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: auth.currentUser.uid == widget.senderUid
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: isDownloading?(){}:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return VideoViewer(
                url: widget.url,
                fileName: widget.fileName,
                aspectRatio: aspectRatio,
                path: widget.path,
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
                    child: auth.currentUser.uid == widget.senderUid?
                    filePath == null?Image.asset("assets/images/videoLoadingError.jpg")
                    :Image.file(File(filePath))
                    : filePath == null?
                    Image.asset("assets/images/videoLoadingError.jpg")
                    :Image.file(File(filePath)))
              ),
              Positioned(
                child: Container(
                  child: Icon(
                    isDownloading?CircularProgressIndicator():Icons.play_circle_fill_rounded,
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

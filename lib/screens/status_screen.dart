import 'dart:async';
import 'dart:io';
import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:application_unknown/screens/Status.dart';
import 'package:application_unknown/widgets/image_status.dart';
import 'package:application_unknown/widgets/status_tag.dart';
import 'package:application_unknown/widgets/text_status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:toast/toast.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  final _auth = FirebaseMethods().auth;
  final videoExtensions = ["mp4"];
  final imageExtensions = ["png", "jpeg", "jpg"];
  bool sending = false;

  StreamSubscription isSending;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  chooseMedia(BuildContext context) async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ["mp4", "png", "jpeg", "jpg"],
        allowMultiple: false);

    File mediaFile = File(result.files.first.path);
    String name = result.names[0];
    String exten = name.split(".").last;

    if (imageExtensions.contains(exten)) {
      Directory targetpath = await getExternalStorageDirectory();
      String fileName = basename(mediaFile.path);
      print(fileName);
      String targetPath = targetpath.path + "/$fileName";
      print(targetPath);
      File result = await FlutterImageCompress.compressAndGetFile(
          mediaFile.absolute.path, targetPath,
          quality: 25);
      UploadTask taskSnapshot;
      taskSnapshot = await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) {
        return ImageStatus(file: result);
      }));
      Toast.show("sending..", context);
      isSending = taskSnapshot.snapshotEvents.listen((event) {
        print(event.state);
        if (event.state == TaskState.running) {
          setState(() {
            sending = true;
          });
        } else if (event.state == TaskState.success) {
          setState(() {
            sending = false;
          });
        } else if (event.state == TaskState.error) {
          setState(() {
            sending = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 30,
          elevation: 0,
          title: Text(
            "Status",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return StatusTag();
                }));
              },
              child: Container(
                margin: EdgeInsets.only(right: 20),
                child: Icon(Icons.notifications_on_rounded),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: StreamBuilder(
                stream: FirebaseMethods()
                    .checkIfStatusExists(_auth.currentUser.uid),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    bool status = snapShot.data.data() == null ? false : true;
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: status
                              ? () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Status(
                                        userId: _auth.currentUser.uid);
                                  }));
                                }
                              : () {},
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                border: status
                                    ? Border.all(
                                        color: Theme.of(context)
                                            .floatingActionButtonTheme
                                            .backgroundColor,
                                        width: 2.5)
                                    : Border.all(
                                        color: Color.fromRGBO(231, 233, 240, 1),
                                        width: 3)),
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage: const AssetImage(
                                  "assets/images/pexels-sindre-strøm-1040880.jpg"),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Your Status",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                        sending
                            ? Text("sending...")
                            : Container(
                                width: 0,
                                height: 0,
                              ),
                        Container(
                          margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return TextStatus();
                                      }));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                        gradient: LinearGradient(
                                          colors: [
                                            Theme.of(context)
                                                .bannerTheme
                                                .backgroundColor,
                                            Theme.of(context)
                                                .floatingActionButtonTheme
                                                .backgroundColor
                                          ],
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.create_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      " Add Text",
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await chooseMedia(context);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                        gradient: LinearGradient(
                                          colors: [
                                            Theme.of(context)
                                                .bannerTheme
                                                .backgroundColor,
                                            Theme.of(context)
                                                .floatingActionButtonTheme
                                                .backgroundColor
                                          ],
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Add Media",
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Status(userId: _auth.currentUser.uid);
                          }));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              border: Border.all(
                                  color: Theme.of(context)
                                      .floatingActionButtonTheme
                                      .backgroundColor,
                                  width: 2.5)),
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage: const AssetImage(
                                "assets/images/pexels-sindre-strøm-1040880.jpg"),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Your Status",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      sending
                          ? Text("sending...")
                          : Container(
                              width: 0,
                              height: 0,
                            ),
                      Container(
                        margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return TextStatus();
                                    }));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1000),
                                      gradient: LinearGradient(
                                        colors: [
                                          Theme.of(context)
                                              .bannerTheme
                                              .backgroundColor,
                                          Theme.of(context)
                                              .floatingActionButtonTheme
                                              .backgroundColor
                                        ],
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.create_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    " Add Text",
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await chooseMedia(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1000),
                                      gradient: LinearGradient(
                                        colors: [
                                          Theme.of(context)
                                              .bannerTheme
                                              .backgroundColor,
                                          Theme.of(context)
                                              .floatingActionButtonTheme
                                              .backgroundColor
                                        ],
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Add Media",
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            height: 50,
            child: StreamBuilder(
                stream: FirebaseMethods().statusUserCanSee(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(20),
                        itemBuilder: (context, index) {
                          DocumentSnapshot ds = snapshot.data.docs[index];
                          return FutureBuilder(
                              future:
                                  FirebaseMethods().getUserWithUid(ds["user"]),
                              builder: (context, snap) {
                                if (snap.hasData && snap.data != null) {
                                  DocumentSnapshot docSnap = snap.data;
                                  return GestureDetector(
                                    onTap: () async {
                                      await FirebaseMethods()
                                          .getStatus(docSnap["Id"]);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: ListTile(
                                          tileColor:
                                              Theme.of(context).cardTheme.color,
                                          contentPadding: EdgeInsets.all(8),
                                          leading: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .floatingActionButtonTheme
                                                      .backgroundColor,
                                                  width: 2.5),
                                            ),
                                            child: const CircleAvatar(
                                              radius: 20,
                                              backgroundImage: const AssetImage(
                                                  "assets/images/pexels-sindre-strøm-1040880.jpg"),
                                            ),
                                          ),
                                          title: Text(
                                            docSnap["Username"],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5,
                                          ),
                                          subtitle: Text(
                                            ds["lastStatusTime"],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              });
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }
}

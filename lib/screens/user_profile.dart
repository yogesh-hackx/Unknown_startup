import 'package:application_unknown/call_utilities/call_utilities.dart';
import 'package:application_unknown/call_utilities/permissions.dart';
import 'package:flutter/material.dart';

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
          elevation: 0,
          title: Text("Profile", style: Theme.of(context).textTheme.caption),
          backgroundColor: const Color.fromRGBO(23, 28, 41, 1),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(23, 28, 41, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      border: Border.all(
                          color: const Color.fromRGBO(109, 175, 254, 1),
                          width: 4),
                    ),
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
                    child: Text(
                      widget.currentUserName,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 2),
                    child: Text(
                      "&UX/UI Developer",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      "Existential Crisis",
                      style: Theme.of(context).textTheme.headline5,
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
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(67, 127, 199, 1),
                                    Color.fromRGBO(109, 175, 254, 1)
                                  ],
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.chat_bubble_rounded,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Message",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(67, 127, 199, 1),
                                    Color.fromRGBO(109, 175, 254, 1)
                                  ],
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.call_rounded,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Voice Call",
                                style: Theme.of(context).textTheme.subtitle2,
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
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromRGBO(67, 127, 199, 1),
                                      Color.fromRGBO(109, 175, 254, 1)
                                    ],
                                  ),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.videocam_rounded,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "Video Call",
                                  style: Theme.of(context).textTheme.subtitle2,
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
              color: const Color.fromRGBO(23, 28, 41, 1),
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
                    style: Theme.of(context).textTheme.headline5,
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
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(67, 127, 199, 1),
                                    Color.fromRGBO(109, 175, 254, 1)
                                  ],
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.share_rounded,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Media Shared",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(67, 127, 199, 1),
                                    Color.fromRGBO(109, 175, 254, 1)
                                  ],
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.volume_off_rounded,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Mute",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(67, 127, 199, 1),
                                    Color.fromRGBO(109, 175, 254, 1)
                                  ],
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.block_rounded,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Block",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(67, 127, 199, 1),
                                    Color.fromRGBO(109, 175, 254, 1)
                                  ],
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.thumb_down_rounded,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Report",
                                style: Theme.of(context).textTheme.subtitle2,
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

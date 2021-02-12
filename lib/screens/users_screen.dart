import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:application_unknown/widgets/chat_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreenUsers extends StatefulWidget {
  @override
  _ChatScreenUsersState createState() => _ChatScreenUsersState();
}

class _ChatScreenUsersState extends State<ChatScreenUsers> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream chatRoomStream;

  getChatRooms() async {
    chatRoomStream = await FirebaseMethods().getChatRooms();
    setState(() {});
  }

  doOnLoad() async {
    getChatRooms();
  }

  getThisUserInfo(String chatRoomId) {
    var userUid =
        chatRoomId.replaceAll(_auth.currentUser.uid, "").replaceAll("_", "");
    return userUid;
  }

  @override
  void initState() {
    doOnLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 30,
          elevation: 0,
          title: Text(
            "Chats",
            style: GoogleFonts.nunito(
                color: Colors.grey[600],
                fontSize: 23,
                fontWeight: FontWeight.w900),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.purple,
              onPressed: FirebaseMethods().logout,
            ),
          ],
        ),
      ),
      body: StreamBuilder(
          stream: chatRoomStream,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: snapShot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapShot.data.docs[index];

                    return StreamBuilder(
                      stream: FirebaseMethods()
                          .getUserInfo(getThisUserInfo(ds["chatRoomId"])),
                      builder: (context, querySnapshot) {
                        if (querySnapshot.hasData) {
                          var userData = querySnapshot.data.docs[0];
                          return StreamBuilder(
                              stream: FirebaseMethods().getUnseenMessages(
                                  ds["chatRoomId"], _auth.currentUser.uid),
                              builder: (context, unseenSnapShot) {
                                if (unseenSnapShot.hasData) {
                                  var unseenCount =
                                      unseenSnapShot.data.docs.length;
                                  print(unseenSnapShot.data.docs);
                                  return ChatListTile(
                                    chatRoomId: ds["chatRoomId"],
                                    lastMessage: ds["lastMessage"],
                                    peerUsername: userData["Username"],
                                    peerUid: userData["Id"],
                                    peerphoneNumber: userData["phoneNumber"],
                                    unseenMessagesCount: "$unseenCount",
                                  );
                                }
                                return Container(
                                  height: 0,
                                  width: 0,
                                );
                              });
                        }
                        return Container(
                          height: 0,
                          width: 0,
                        );
                      },
                    );
                  });
            } else {
              return Container();
            }
          }),
    );
  }
}

import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:application_unknown/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _auth = FirebaseAuth.instance;

  TextEditingController search = TextEditingController();

  bool isSearching = false;

  Stream usersStream;

  onsearch(String phoneNumber) async {
    usersStream = FirebaseMethods().getUser(phoneNumber);
  }

  getChatThreadId(String userUid1, String userUid2) {
    if (userUid1.substring(0, 1).codeUnitAt(0) >
        userUid2.substring(0, 1).codeUnitAt(0)) {
      return userUid2 + "_" + userUid1;
    } else {
      return userUid1 + "_" + userUid2;
    }
  }

  Widget searchUserTile(String peerUsername, String phoneNumber, String id) {
    return GestureDetector(
        onTap: () {
          var chatRoomId = getChatThreadId(_auth.currentUser.uid, id);
          Map<String, dynamic> chatRoomInfoMap = {
            "users": [_auth.currentUser.uid, id],
          };

          FirebaseMethods().createChatRoom(chatRoomId, chatRoomInfoMap);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                      chatRoomId: chatRoomId,
                      peerUsername: peerUsername,
                      peerphoneNumber: phoneNumber,
                      peerId: id)));
        },
        child: Row(
          children: [
            ClipRRect(
              child: Image.asset(
                "assets/images/man-1246508_1920.jpg",
                height: 30,
                width: 30,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(peerUsername), Text(phoneNumber)],
            ),
          ],
        ));
  }

  Widget searchUserList() {
    return StreamBuilder(
      stream: usersStream,
      builder: (context, snapShots) {
        return snapShots.hasData
            ? ListView.builder(
                itemCount: snapShots.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapShots.data.docs[index];
                  return searchUserTile(
                      ds["Username"], ds["phoneNumber"], ds["Id"]);
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
              contentPadding: const EdgeInsets.only(right: 30, left: 20),
              trailing: InkWell(
                onTap: () {
                  if (search.text != "") {
                    onsearch(search.text.trim());
                    print(search.text.trim());

                    setState(() {
                      isSearching = true;
                    });
                  }
                },
                child: Icon(
                  Icons.search_sharp,
                  color: Colors.indigo,
                  size: 30,
                ),
              ),
              title: TextField(
                controller: search,
                cursorHeight: 20,
                cursorColor: Colors.deepPurple,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )),
          Expanded(child: searchUserList())
        ],
      ),
    );
  }
}

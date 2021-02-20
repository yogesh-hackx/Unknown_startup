import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:application_unknown/screens/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {

  final _auth = FirebaseMethods().auth;

  doOnLoad()async{
    PermissionStatus permission = await Permission.contacts.request();
  }

  Future<List> getContacts()async{
    Iterable<Contact> contacts  = await ContactsService.getContacts();
    List fullContacts = [];
    fullContacts.addAll(contacts);
    return fullContacts;
    }
  

  String getChatThreadId(String userUid1, String userUid2) {
    print(userUid2);
    if (userUid1.substring(0, 1).codeUnitAt(0) >
        userUid2.substring(0, 1).codeUnitAt(0)) {
      return userUid2 + "_" + userUid1;
    } else {
      return userUid1 + "_" + userUid2;
    }
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
          titleSpacing: 30,
          elevation: 0,
          title: Text(
            "Contacts",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: FutureBuilder(
            future: getContacts(),
            builder: (context,contacts){
          if(contacts.hasData && contacts.data != null){
            return ListView.builder(
          itemCount: contacts.data.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context,index){
            Contact c =  contacts.data[index];
            String contactName = c.displayName;
            String contactNumber = c.phones.first.value;
            return StreamBuilder<QuerySnapshot>(
              stream: FirebaseMethods().getUser(contactNumber),
              builder: (context, snapshot) {
                if(snapshot.hasData && snapshot.data.docs.isEmpty==false){
                  QuerySnapshot querySnapshot = snapshot.data;
                  String peerUserName = querySnapshot.docs[0]["Username"];
                  String peerPhoneNumber = querySnapshot.docs[0]["phoneNumber"];
                  String peerId = querySnapshot.docs[0]["Id"];
                  return GestureDetector(
                    onTap: ()async{
                      String chatRoomId = getChatThreadId(querySnapshot.docs[0]["Id"], _auth.currentUser.uid);
                      Map<String, dynamic> chatRoomInfoMap = {
                          "users": [_auth.currentUser.uid, querySnapshot.docs[0]["Id"]],
                            };
                      await FirebaseMethods().createChatRoom(chatRoomId, chatRoomInfoMap);
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ChatScreen(peerId: peerId,peerUsername: peerUserName,peerphoneNumber: peerPhoneNumber,chatRoomId: chatRoomId,);
                      }));
                    },
                    child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: ListTile(
                        tileColor: Theme.of(context).appBarTheme.color,
                        contentPadding: const EdgeInsets.all(5),
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
                            backgroundImage: AssetImage(
                                "assets/images/pexels-sindre-strøm-1040880.jpg"),
                          ),
                        ),
                        title: Text(
                          querySnapshot.docs[0]["Username"],
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        subtitle: Text(
                          "EveryTruth will unwrap at some point of time just wait my love..",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                ),
                  );
                }
                return Container(width:0,height:0); 
              }
            );
          },
        );
              }
          
            },
          
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}
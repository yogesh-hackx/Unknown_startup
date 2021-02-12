import 'package:flutter/material.dart';

import '../firebase/FirebaseMethods.dart';

class UnseenMessage extends StatelessWidget {

  final Scaffold scaffold;
  final String chatRoomId;
  final String uid;

  UnseenMessage({Key key, this.scaffold, this.chatRoomId, this.uid});

  final FirebaseMethods firebaseMethods = FirebaseMethods();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firebaseMethods.getUnseenMessages(chatRoomId, uid),
      builder: (context,snapShot){
        if(snapShot.hasData && snapShot.data != null){
          firebaseMethods.updateUnseenMessages(chatRoomId, uid);
          return scaffold;
        }
        else{
          return scaffold;
        }
      },
    );
  }
}
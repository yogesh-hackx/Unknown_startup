import 'package:application_unknown/screens/home_screen.dart';
import 'package:application_unknown/screens/otp_screen.dart';
import 'package:application_unknown/screens/user_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseMethods {
  bool isUploading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  verifyPhoneNumber(String phoneNumber, BuildContext context) async {
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result = await auth.signInWithCredential(credential);

          User user = result.user;
          if (user != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
          } else {
            print("Error");
          }
          print(user);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == "invalid-phone-number") {
            print("The Provided phone number is not valid");
          }
        },
        codeSent: (String verificationId, int resendToken) {
          print("Reached code Sent!!!!!!!!!!");
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return OneTimePassword(verificationId);
          }));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return OneTimePassword(verificationId);
          }));
        });
  }

  verifyOtp(String verificationId, String otp, BuildContext context) async {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);

    UserCredential result = await auth.signInWithCredential(credential);

    bool isnewUser = result.additionalUserInfo.isNewUser;
    print("If the user is new? $isnewUser");

    if (isnewUser) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return UserDetails();
        }),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }),
      );
    }
  }

  logout() {
    auth.signOut();
  }

  updateUserDetail(String username, String bio, BuildContext context) async {
    await firestore.collection("users").doc(auth.currentUser.uid).set({
      "Id": auth.currentUser.uid,
      "Username": username,
      "bio": bio,
      "phoneNumber": auth.currentUser.phoneNumber,
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }),
    );
  }

  getUser(String phoneNumber) async {
    return firestore
        .collection('users')
        .where("phoneNumber", isEqualTo: phoneNumber)
        .snapshots();
  }

  sendMessage(String chatRoomId, Map messageInfoMap) async {
    return firestore
        .collection("userChats")
        .doc(chatRoomId)
        .collection("chats")
        .add(messageInfoMap);
  }

  sendInitialAttachMentMessage(String chatRoomId,String messageUid,Map initialInfoMap)async{
    return firestore
      .collection("userChats")
      .doc(chatRoomId)
      .collection("chats")
      .doc(messageUid)
      .set(initialInfoMap);
  }

  sendFinalAttachMentMessage(String chatRoomId,String messageUid,Map finalInfoMap)async{
    return firestore
      .collection("userChats")
      .doc(chatRoomId)
      .collection("chats")
      .doc(messageUid)
      .update(finalInfoMap);
  }


  updateLastMessageSent(String chatRoomId, Map lastMessageInfoMap) {
    return firestore
        .collection("userChats")
        .doc(chatRoomId)
        .update(lastMessageInfoMap);
  }

  createChatRoom(String chatRoomId, Map chatRoomInfoMap) async {
    final snapShot =
        await firestore.collection("userChats").doc(chatRoomId).get();

    if (snapShot.exists) {
      return true;
    } else {
      return firestore
          .collection("userChats")
          .doc(chatRoomId)
          .set(chatRoomInfoMap);
    }
  }

  Future<Stream<QuerySnapshot>> getChatRoomMessages(String chatRoomId) async {
    return firestore
        .collection("userChats")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy("DateTime", descending: true)
        .snapshots(includeMetadataChanges: true);
  }

  Future<Stream<QuerySnapshot>> getChatRooms() async {
    return firestore
        .collection("userChats")
        .orderBy("lastMessageSendTimeDate", descending: true)
        .where("users", arrayContains: auth.currentUser.uid)
        .snapshots();
  }

  Stream<QuerySnapshot> getUserInfo(String userUid) {
    return firestore
        .collection("users")
        .where("Id", isEqualTo: userUid)
        .snapshots();
  }

  getUnseenMessages(String chatRoomId, String uid) {
    return firestore
        .collection("userChats")
        .doc(chatRoomId)
        .collection("chats")
        .where("receiverId", isEqualTo: uid)
        .where("isSeen", isEqualTo: false)
        .snapshots();
  }

  updateUnseenMessages(String chatRoomId, String uid) async {
    return firestore
        .collection("userChats")
        .doc(chatRoomId)
        .collection("chats")
        .where("receiverId", isEqualTo: uid)
        .where("isSeen", isEqualTo: false)
        .get()
        .then((value) => value.docs.forEach((doc) {
              doc.reference.update({
                "isSeen": true,
              });
            }));
  }
  deleteMessage(String messageUid,String chatRoomId,Map<String, dynamic> deleteMessageMap)async{
  await firestore
  .collection("userChats")
  .doc(chatRoomId)
  .collection("chats")
  .doc(messageUid)
  .update(deleteMessageMap);
}


  Stream<DocumentSnapshot> getMsgSeenOrUnseen(String chatRoomId, String messageId){

  return firestore
  .collection("userChats")
  .doc(chatRoomId)
  .collection("chats")
  .doc(messageId)
  .snapshots();

}

updateTypingIndicator(String chatRoomId,Map<String,dynamic> typingIndicatorMap)async{

  return await firestore
  .collection("userChats")
  .doc(chatRoomId)
  .update(typingIndicatorMap);
}

Stream<DocumentSnapshot> getTypingIndicator(String chatRoomId){

  return firestore
  .collection("userChats")
  .doc(chatRoomId)
  .snapshots();

}

updateOnlineIndicator(Map<String,dynamic> onlineIndicatorMap){

  return firestore
  .collection("users")
  .doc(auth.currentUser.uid)
  .update(onlineIndicatorMap);
}

Stream<DocumentSnapshot> getOnlineIndicator(String peerId){
  return firestore
  .collection("users")
  .doc(peerId)
  .snapshots();
}

Future<DocumentReference> createStatus(String userUid,Map statusInfoMap)async{
  return firestore
    .collection("status")
    .doc(userUid)
    .collection("userStatus")
    .add(statusInfoMap);
}
updateLastStatus(String userUid,Map lastStatusMap)async{
  return firestore
    .collection("status")
    .doc(userUid)
    .set(lastStatusMap);
}

Future<QuerySnapshot> getStatus(String userId)async{
  return firestore
    .collection("status")
    .doc(userId)
    .collection("userStatus")
    .get();

}

}
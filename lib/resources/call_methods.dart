import 'package:application_unknown/models/call.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CallMethods{

  final CollectionReference callCollection = FirebaseFirestore.instance.collection("callCollection");

  Stream<DocumentSnapshot> callStream({String uid}){
    return callCollection.doc(uid).snapshots();
  }

  Future<bool> makeCall({Call call}) async{

    try{
      call.hasDialed = true;
    Map<String,dynamic> hasDialedMap = call.toMap(call);
    call.hasDialed = false;
    Map<String,dynamic> hasNotDialedMap = call.toMap(call);

    await callCollection.doc(call.callerId).set(hasDialedMap);
    await callCollection.doc(call.receiverId).set(hasNotDialedMap);
    return true;
    }catch(e){
      print(e);
      return false;
    }
  }

  Future<bool> endCall({Call call})async{

    try{
    await callCollection.doc(call.callerId).delete();
    await callCollection.doc(call.receiverId).delete();
    return true;
    }
    catch(e){
      print(e);
      return false;
    }


  }

}
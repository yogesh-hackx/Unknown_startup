import 'dart:math';

import 'package:application_unknown/call_screens/call_screen.dart';
import 'package:application_unknown/models/call.dart';
import 'package:application_unknown/resources/call_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallUtilies{

  static final CallMethods callMethods = CallMethods();
  
  static dial({String fromUid, String fromName,String toUid,String toName, context})async{
    Call call = Call(
      callerId: fromUid,
      callerName: fromName,
      receiverId: toUid,
      receiverName: toName,
      channelId: Random().nextInt(1000).toString(),
    );

    bool callMade = await CallMethods().makeCall(call:call);

    call.hasDialed = true;

    if(callMade){
      Navigator.push(context, 
      MaterialPageRoute(
        builder: (context){
          return CallScreen(call: call);
        }));
    }
  }

}
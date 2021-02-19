import 'dart:async';
import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:intl/intl.dart';

class UserOne extends StatefulWidget {
  final String msg;
  final Function requestfocus;
  final Function swipeleft;
  final String messageUid;
  final Function deleteMessage;
  final String chatRoomId;
  final DateTime timeSent;
  final bool isSeen;

  UserOne(
      {Key key,
      this.msg,
      this.requestfocus,
      this.swipeleft,
      this.messageUid,
      this.deleteMessage,
      this.chatRoomId,
      this.timeSent,
      this.isSeen});

  @override
  _UserOneState createState() => _UserOneState();
}

class _UserOneState extends State<UserOne> {
  bool isSeen;
  StreamSubscription seenOrUnseen;
  bool notSend = false;
  var dateFormat = DateFormat.jm();

  @override
  void initState() {
    if (widget.isSeen == true) {
      isSeen = true;
    } else {
      isSeen = false;
      addSubscription();
    }
    super.initState();
  }

  addSubscription() {
    seenOrUnseen = FirebaseMethods()
        .getMsgSeenOrUnseen(widget.chatRoomId, widget.messageUid)
        .listen((DocumentSnapshot ds) {
      if (ds.exists) {
        if (ds.data() != null) {
          if (ds.data()["isSeen"] == true) {
            if (isSeen == false) {
              setState(() {
                isSeen = true;
              });
            }
          }
        }
      }
    });
  }

  @override
  void dispose() {
    if (widget.isSeen == false) {
      seenOrUnseen.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.messageUid);
    return GestureDetector(
      child: UnconstrainedBox(
        alignment: Alignment.centerRight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SwipeTo(
              onRightSwipe: () {
                widget.requestfocus(context);
              },
              onLeftSwipe: () {
                widget.swipeleft(context, widget.messageUid);
              },
              child: InkWell(
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Text("Are you sure?",
                                  style: GoogleFonts.nunito(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: OutlineButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("No",
                                            style: GoogleFonts.nunito(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.indigo)),
                                        borderSide: BorderSide(
                                            color: Colors.indigo, width: 2)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: OutlineButton(
                                      onPressed: () {
                                        widget.deleteMessage(
                                            widget.messageUid, context);
                                      },
                                      child: Text("Yes",
                                          style: GoogleFonts.nunito(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.indigo)),
                                      borderSide: BorderSide(
                                          color: Colors.indigo, width: 2),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  constraints: BoxConstraints(maxWidth: 250),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).cardTheme.color,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    ),
                    color: Theme.of(context).cardTheme.color,
                  ),
                  child: Text(
                    widget.msg,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 2),
              child: Icon(
                !isSeen
                    ? Icons.check_circle_outline
                    : Icons.check_circle_rounded,
                size: 15,
                color:
                    Theme.of(context).floatingActionButtonTheme.backgroundColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                dateFormat.format(widget.timeSent),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

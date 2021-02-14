import 'package:application_unknown/screens/chat_screen.dart';
import 'package:application_unknown/widgets/delete_modal.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatListTile extends StatefulWidget {
  final String lastMessage;
  final String chatRoomId;
  final String peerUsername;
  final String peerUid;
  final String peerphoneNumber;
  final String unseenMessagesCount;
  final DateTime lastMessageTime;

  ChatListTile(
      {Key key,
      this.lastMessage,
      this.chatRoomId,
      this.peerUsername,
      this.peerUid,
      this.peerphoneNumber,
      this.unseenMessagesCount,
      this.lastMessageTime});

  @override
  _ChatListTileState createState() => _ChatListTileState();
}

class _ChatListTileState extends State<ChatListTile> {
  bool islongPress = false;
  var dateFormat = DateFormat.jm();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.peerUsername);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: (islongPress
              ? [
                  BoxShadow(
                    color: Colors.grey[400].withOpacity(0.5),
                    offset: Offset(-6.0, -6.0),
                    blurRadius: 16.0,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(6.0, 6.0),
                    blurRadius: 16.0,
                  ),
                ]
              : []),
        ),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ChatScreen(
                  peerUsername: widget.peerUsername,
                  peerId: widget.peerUid,
                  peerphoneNumber: widget.peerphoneNumber,
                  chatRoomId: widget.chatRoomId,
                );
              }),
            );
            setState(() {
              islongPress = false;
            });
          },
          onLongPress: () {
            setState(() {
              islongPress = true;
            });
          },
          tileColor: Colors.white,
          contentPadding: const EdgeInsets.all(10),
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage:
                AssetImage("assets/images/pexels-sindre-strøm-1040880.jpg"),
          ),
          title: Text(
            widget.peerUsername,
            style: GoogleFonts.nunito(
                fontSize: 17,
                fontWeight: FontWeight.w900,
                color: Colors.grey[800]),
          ),
          subtitle: Text(
            widget.lastMessage,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleFonts.nunito(fontWeight: FontWeight.w700),
          ),
          trailing: (islongPress
              ? InkWell(
                  onTap: () {
                    setState(() {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return DeleteModal();
                          });
                      islongPress = false;
                    });
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      dateFormat.format(widget.lastMessageTime),
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w900, color: Colors.black45),
                    ),
                    if (widget.unseenMessagesCount != "0")
                      Badge(
                        badgeContent: Text(
                          widget.unseenMessagesCount,
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w800, color: Colors.white),
                        ),
                        badgeColor: Colors.indigo,
                        padding: const EdgeInsets.all(7),
                      )
                  ],
                )),
        ),
      ),
    );
  }
}

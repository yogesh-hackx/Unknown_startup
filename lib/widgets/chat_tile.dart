import 'package:application_unknown/screens/chat_screen.dart';
import 'package:application_unknown/widgets/delete_modal.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:intl/intl.dart';

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
                    color: Colors.white.withOpacity(0.1),
                    offset: Offset(-6.0, -6.0),
                    blurRadius: 16.0,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    offset: Offset(6.0, 6.0),
                    blurRadius: 16.0,
                  ),
                ]
              : []),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: ListTile(
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
            tileColor: const Color.fromRGBO(23, 28, 41, 1),
            contentPadding: const EdgeInsets.all(9),
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(
                      "assets/images/pexels-sindre-strøm-1040880.jpg"),
                ),
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: Badge(
                      badgeColor: Colors.green,
                      padding: EdgeInsets.all(5),
                    ),
                  ),
                )
              ],
            ),
            title: Text(
              widget.peerUsername,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              widget.lastMessage,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline6,
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
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      if (widget.unseenMessagesCount != "0")
                        Badge(
                          badgeContent: Text(widget.unseenMessagesCount,
                              style: Theme.of(context).textTheme.button),
                          badgeColor: const Color.fromRGBO(109, 175, 254, 1),
                          padding: const EdgeInsets.all(7),
                        )
                    ],
                  )),
          ),
        ),
      ),
    );
  }
}

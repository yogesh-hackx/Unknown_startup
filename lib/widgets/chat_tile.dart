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
  //final Function profile;

  ChatListTile({
    Key key,
    this.lastMessage,
    this.chatRoomId,
    this.peerUsername,
    this.peerUid,
    this.peerphoneNumber,
    this.unseenMessagesCount,
    this.lastMessageTime,
    //this.profile,
  });

  @override
  _ChatListTileState createState() => _ChatListTileState();
}

class _ChatListTileState extends State<ChatListTile> {
  bool islongPress = false;
  var dateFormat = DateFormat.jm();

  bool tileColor = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.peerUsername);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(),
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
                tileColor: (widget.unseenMessagesCount != "0"
                    ? Theme.of(context).bannerTheme.backgroundColor
                    : Theme.of(context).cardTheme.color),
                contentPadding: const EdgeInsets.all(6),
                leading: GestureDetector(
                  onTap: () {
                    // widget.profile();
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: (widget.unseenMessagesCount != "0"
                              ? Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .unselectedItemColor
                              : Theme.of(context)
                                  .floatingActionButtonTheme
                                  .backgroundColor),
                          width: 2.5),
                    ),
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: const AssetImage(
                          "assets/images/pexels-sindre-strøm-1040880.jpg"),
                    ),
                  ),
                ),
                title: Text(
                  widget.peerUsername,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Text(
                  widget.lastMessage,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: (widget.unseenMessagesCount != "0"
                      ? Theme.of(context).textTheme.button
                      : Theme.of(context).textTheme.headline6),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(color: Colors.white)),
                              badgeColor: Theme.of(context)
                                  .floatingActionButtonTheme
                                  .backgroundColor,
                              padding: const EdgeInsets.all(6),
                            )
                        ],
                      )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

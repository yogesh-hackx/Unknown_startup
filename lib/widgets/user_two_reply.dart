import 'package:flutter/material.dart';

class UserOneReply extends StatefulWidget {
  final String message;
  final String reply;

  UserOneReply({Key key, this.message, this.reply});

  @override
  _UserOneReplyState createState() => _UserOneReplyState();
}

class _UserOneReplyState extends State<UserOneReply> {
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        alignment: Alignment.centerLeft,
        width: 200,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "You",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.message,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.reply,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

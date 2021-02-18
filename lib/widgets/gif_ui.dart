import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Gif1 extends StatefulWidget {
  final String url;
  final String senderUid;

  Gif1({Key key, this.url,this.senderUid});

  @override
  _Gif1State createState() => _Gif1State();
}

class _Gif1State extends State<Gif1> {

  final _auth = FirebaseMethods().auth;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      imageBuilder: (context, imageProvider) {
        return Row(
          mainAxisAlignment: _auth.currentUser.uid == widget.senderUid ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 130,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[400],
              ),
              child: ClipRRect(child: Image(image: imageProvider)),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 2),
              child: Icon(
                Icons.check_circle_rounded,
                size: 15,
                color: Color.fromRGBO(109, 175, 254, 1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child:
                  Text("10:30pm", style: Theme.of(context).textTheme.bodyText2),
            ),
          ],
        );
      },
    );
  }
}

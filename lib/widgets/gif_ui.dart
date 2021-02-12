import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Gif1 extends StatefulWidget {
  final String url;

  Gif1({Key key, this.url});

  @override
  _Gif1State createState() => _Gif1State();
}

class _Gif1State extends State<Gif1> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      imageBuilder: (context, imageProvider) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 130,
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    offset: Offset(-6.0, -6.0),
                    blurRadius: 16.0,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(6.0, 6.0),
                    blurRadius: 16.0,
                  ),
                ],
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
                color: Colors.indigo,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Text("10:30pm",
                    style: GoogleFonts.nunito(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Colors.teal[300]))),
          ],
        );
      },
    );
  }
}

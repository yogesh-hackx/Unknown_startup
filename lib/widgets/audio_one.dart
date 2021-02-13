import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Audio extends StatefulWidget {
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
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
          border: Border.all(color: Colors.grey[200]),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.headset,
                color: Colors.indigo,
                size: 40,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 70,
                    width: 200,
                    child: Image(
                      image: AssetImage(
                        "assets/images/Asset1.png",
                      ),
                    )),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        "You and I.mp3",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w800,
                          color: Colors.indigo[800],
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.arrow_circle_down,
                  color: Colors.indigo[700],
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

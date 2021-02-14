import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class User2 extends StatefulWidget {
  final String msg;
  final String timeSent;

  User2({Key key, this.msg,this.timeSent});

  @override
  _User2State createState() => _User2State();
}

class _User2State extends State<User2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 250),
            margin: const EdgeInsets.only(bottom: 5, top: 5, right: 3),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  offset: Offset(-6.0, -6.0),
                  blurRadius: 16.0,
                ),
                BoxShadow(
                  color: Color.fromRGBO(109, 175, 254, 0.3),
                  offset: Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ],
              border: Border.all(
                color: Color.fromRGBO(109, 175, 254, 1),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(67, 127, 199, 1),
                  Color.fromRGBO(109, 175, 254, 1)
                ],
              ),
            ),
            child: Text(
              widget.msg,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 5, top: 5),
              child: Text(widget.timeSent,
                  style: GoogleFonts.nunito(
                      fontSize: 12, fontWeight: FontWeight.w800))),
        ],
      ),
    );
  }
}

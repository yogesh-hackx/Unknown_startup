import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Delete2 extends StatefulWidget {
  @override
  _Delete2State createState() => _Delete2State();
}

class _Delete2State extends State<Delete2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            child: Text("10:30pm",
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ))),
        InkWell(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            constraints: BoxConstraints(maxWidth: 300),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  offset: Offset(-6.0, -6.0),
                  blurRadius: 16.0,
                ),
                BoxShadow(
                  color: Colors.indigo[900].withOpacity(0.3),
                  offset: Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ],
              border: Border.all(color: Colors.indigo[400]),
              borderRadius: BorderRadius.circular(5),
              color: Colors.indigo[400],
            ),
            child: Text(
              "This message was deleted",
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

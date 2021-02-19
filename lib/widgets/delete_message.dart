import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteOne extends StatefulWidget {
  @override
  _DeleteOneState createState() => _DeleteOneState();
}

class _DeleteOneState extends State<DeleteOne> {
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: Alignment.centerRight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              constraints: BoxConstraints(maxWidth: 300),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(53, 61, 81, 1),
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
                color: Color.fromRGBO(53, 61, 81, 1),
              ),
              child: Text(
                "This message was deleted",
                style: GoogleFonts.nunito(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5, left: 2),
            child: Icon(
              Icons.check_circle_rounded,
              size: 15,
              color:
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              "10:30pm",
              style: GoogleFonts.nunito(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Colors.white60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

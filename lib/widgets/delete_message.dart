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
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
                color: Colors.grey[200],
              ),
              child: Text(
                "This message was deleted",
                style: GoogleFonts.nunito(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
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
              color: Colors.indigo,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              "10:30pm",
              style: GoogleFonts.nunito(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Colors.teal[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteModal extends StatefulWidget {
  @override
  _DeleteModalState createState() => _DeleteModalState();
}

class _DeleteModalState extends State<DeleteModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              "Are you sure you want to delete?",
              style: GoogleFonts.nunito(
                fontSize: 21,
                fontWeight: FontWeight.w900,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, right: 30, left: 20),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.indigo,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "No",
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 30, top: 10),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.indigo,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Yes",
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

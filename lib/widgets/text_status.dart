import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStatus extends StatefulWidget {
  @override
  _TextStatusState createState() => _TextStatusState();
}

class _TextStatusState extends State<TextStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          titleSpacing: 30,
          elevation: 0,
          title: Text(
            "Your Status",
            style: GoogleFonts.nunito(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.black.withOpacity(0.1),
        ),
      ),
      backgroundColor: Colors.blue,
      body: Container(
        margin: EdgeInsets.all(30),
        child: Center(
          child: TextField(
            style: GoogleFonts.nunito(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            cursorColor: Colors.white,
            cursorHeight: 40,
            maxLength: 224,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            //decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        color: Colors.black.withOpacity(0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Icon(
                Icons.emoji_emotions_rounded,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: 20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(67, 127, 199, 1),
                      Color.fromRGBO(109, 175, 254, 1)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

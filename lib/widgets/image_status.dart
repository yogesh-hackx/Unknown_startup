import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageStatus extends StatefulWidget {
  @override
  _ImageStatusState createState() => _ImageStatusState();
}

class _ImageStatusState extends State<ImageStatus> {
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
                color: Colors.white70,
                fontSize: 25,
                fontWeight: FontWeight.w900),
          ),
          backgroundColor: Colors.black87,
        ),
      ),
      body: Center(
        child: Container(
          child: Image(
            image: AssetImage("assets/images/pexels-sindre-strøm-1040880.jpg"),
          ),
        ),
      ),
      backgroundColor: Colors.black87,
      bottomNavigationBar: SizedBox(
        child: Container(
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, bottom: 15, top: 5),
                    width: 330,
                    padding: const EdgeInsets.all(4),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        prefixIcon: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.emoji_emotions_rounded,
                            color: Colors.white,
                          ),
                        ),
                        hintText: "Add caption",
                        hintStyle: GoogleFonts.nunito(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white70),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 10, bottom: 15, top: 5),
                      padding: const EdgeInsets.all(13),
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
            ],
          ),
        ),
      ),
    );
  }
}

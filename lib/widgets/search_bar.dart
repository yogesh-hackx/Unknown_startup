import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(right: 30, left: 20),
          leading: Icon(
            Icons.search_rounded,
            color: Colors.purpleAccent,
            size: 30,
          ),
          title: Text(
            "Search",
            style: GoogleFonts.nunito(
                fontSize: 17, fontWeight: FontWeight.w800, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

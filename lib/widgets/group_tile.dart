import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;

  GroupTile({
    @required this.imageUrl,
    @required this.title,
    @required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: Colors.white,
                offset: Offset(3, 3),
                spreadRadius: -1.0),
            BoxShadow(
                blurRadius: 20,
                color: Colors.grey[100],
                offset: Offset(-3, -3),
                spreadRadius: -1.0),
          ],
        ),
        child: ListTile(
          onLongPress: () {},
          onTap: () {},
          tileColor: Colors.white,
          contentPadding: const EdgeInsets.all(10),
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(imageUrl),
          ),
          title: Text(
            title,
            style: GoogleFonts.nunito(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.grey[800]),
          ),
          subtitle: Text(
            subTitle,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w700,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "7h",
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w900, color: Colors.black45),
              ),
              Badge(
                badgeContent: Text(
                  "2",
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w800, color: Colors.white),
                ),
                badgeColor: Colors.purple,
                padding: const EdgeInsets.all(7),
              )
            ],
          ),
        ),
      ),
    );
  }
}

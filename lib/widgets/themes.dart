import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes extends StatefulWidget {
  @override
  _ThemesState createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  bool isSelected = false;
  ThemeData color = ThemeData(
    textTheme: TextTheme(
      headline1: GoogleFonts.nunito(
          color: Colors.white, fontSize: 40, fontWeight: FontWeight.w800),
      headline2: GoogleFonts.nunito(
          color: Colors.white70, fontSize: 35, fontWeight: FontWeight.w800),
      headline3: GoogleFonts.nunito(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
      headline5: GoogleFonts.nunito(
          color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800),
      headline4: GoogleFonts.nunito(
        color: Colors.white70,
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
      headline6: GoogleFonts.nunito(
        color: const Color.fromRGBO(23, 221, 200, 1),
        fontSize: 14,
        fontWeight: FontWeight.w800,
      ),
      subtitle1: GoogleFonts.nunito(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
      subtitle2: GoogleFonts.nunito(
          color: Colors.white70, fontSize: 14, fontWeight: FontWeight.bold),
      button: GoogleFonts.nunito(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
      bodyText1: GoogleFonts.nunito(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: GoogleFonts.nunito(
        fontSize: 12,
        color: Colors.white60,
        fontWeight: FontWeight.w800,
      ),
      caption: GoogleFonts.nunito(
          fontWeight: FontWeight.w900, color: Colors.white, fontSize: 20),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    scaffoldBackgroundColor: Color.fromRGBO(37, 41, 54, 1),
    appBarTheme: AppBarTheme(
      color: const Color.fromRGBO(44, 48, 64, 1),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      color: const Color.fromRGBO(53, 61, 81, 1),
    ),
    bannerTheme: MaterialBannerThemeData(
      backgroundColor: const Color.fromRGBO(15, 177, 164, 1),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color.fromRGBO(24, 223, 200, 1),
    ),
    buttonColor: const Color.fromRGBO(255, 196, 145, 1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color.fromRGBO(37, 41, 54, 1),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromRGBO(24, 223, 200, 1),
      unselectedItemColor: Colors.white70,
      selectedLabelStyle: GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          titleSpacing: 30,
          elevation: 0,
          title: Text(
            "Themes",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ThemeSwitcher(
                builder: (context) {
                  return SwitchListTile(
                    value: isSelected,
                    onChanged: (bool newValue) {
                      setState(() {
                        isSelected = newValue;
                        ThemeSwitcher.of(context).changeTheme(
                            theme: color,
                            reverseAnimation: true // default: false
                            );
                      });
                    },
                    title: Text(
                      "Royal blue",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

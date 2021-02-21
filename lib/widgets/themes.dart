import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes extends StatefulWidget {
  @override
  _ThemesState createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  bool isSelected1 = false;
  bool isSelected2 = false;
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
        color: Colors.white54,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline6: GoogleFonts.nunito(
        color: const Color.fromRGBO(252, 69, 69, 1),
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
    scaffoldBackgroundColor: Color.fromRGBO(27, 34, 46, 1),
    appBarTheme: AppBarTheme(
      color: const Color.fromRGBO(27, 34, 46, 1),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      color: const Color.fromRGBO(43, 53, 71, 1),
    ),
    bannerTheme: MaterialBannerThemeData(
      backgroundColor: const Color.fromRGBO(131, 35, 35, 1),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color.fromRGBO(252, 69, 69, 1),
    ),
    buttonColor: const Color.fromRGBO(252, 69, 69, 1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color.fromRGBO(27, 34, 46, 1),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromRGBO(252, 69, 69, 1),
      unselectedItemColor: Colors.white70,
      selectedLabelStyle: GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  ThemeData color1 = ThemeData(
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
        color: Colors.white54,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline6: GoogleFonts.nunito(
        color: const Color.fromRGBO(99, 133, 239, 1),
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
    scaffoldBackgroundColor: Color.fromRGBO(32, 36, 66, 1),
    appBarTheme: AppBarTheme(
      color: const Color.fromRGBO(32, 36, 66, 1),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      color: const Color.fromRGBO(37, 41, 74, 1),
    ),
    bannerTheme: MaterialBannerThemeData(
      backgroundColor: const Color.fromRGBO(99, 133, 239, 1),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color.fromRGBO(99, 133, 239, 1),
    ),
    buttonColor: const Color.fromRGBO(99, 133, 239, 1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color.fromRGBO(32, 36, 66, 1),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromRGBO(99, 133, 239, 1),
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
                    value: isSelected1,
                    onChanged: (bool newValue) {
                      setState(() {
                        isSelected1 = newValue;
                        ThemeSwitcher.of(context).changeTheme(
                          theme: color,
                        );
                      });
                    },
                    title: Text(
                      "DarkTheme 1",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ThemeSwitcher(
                builder: (context) {
                  return SwitchListTile(
                    value: isSelected2,
                    onChanged: (bool newValue) {
                      setState(() {
                        isSelected2 = newValue;
                        ThemeSwitcher.of(context).changeTheme(
                          theme: color1,
                        );
                      });
                    },
                    title: Text(
                      "DarkTheme 2",
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

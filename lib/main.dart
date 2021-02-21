import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:application_unknown/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  ThemeData blue = ThemeData(
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
        color: const Color.fromRGBO(7, 159, 236, 1),
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
    scaffoldBackgroundColor: Color.fromRGBO(14, 14, 14, 1),
    appBarTheme: AppBarTheme(
      color: const Color.fromRGBO(14, 14, 14, 1),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      color: const Color.fromRGBO(29, 30, 34, 1),
    ),
    bannerTheme: MaterialBannerThemeData(
      backgroundColor: const Color.fromRGBO(71, 211, 255, 1),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color.fromRGBO(7, 159, 236, 1),
    ),
    buttonColor: const Color.fromRGBO(7, 159, 236, 1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color.fromRGBO(14, 14, 14, 1),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromRGBO(7, 159, 236, 1),
      unselectedItemColor: Colors.white,
      selectedLabelStyle: GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Map<String, bool> onlineIndicatorMap = {"isOnline": true};
      FirebaseMethods().updateOnlineIndicator(onlineIndicatorMap);
    } else {
      var dateFormatter = DateFormat.jm().format(DateTime.now());
      Map<String, dynamic> onlineIndicatorMap = {
        "isOnline": false,
        "lastSeen": dateFormatter
      };
      FirebaseMethods().updateOnlineIndicator(onlineIndicatorMap);
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: blue,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeProvider.of(context),
            home: Helper(),
          );
        },
      ),
    );
  }
}

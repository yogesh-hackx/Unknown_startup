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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: TextTheme(
            headline1: GoogleFonts.nunito(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w800),
            headline2: GoogleFonts.nunito(
                color: Colors.white70,
                fontSize: 35,
                fontWeight: FontWeight.w800),
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
              color: const Color.fromRGBO(109, 175, 254, 1),
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
            subtitle1: GoogleFonts.nunito(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
            subtitle2: GoogleFonts.nunito(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.bold),
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
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: const Color.fromRGBO(109, 175, 254, 1),
          ),
          buttonColor: const Color.fromRGBO(109, 175, 254, 1),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: const Color.fromRGBO(23, 28, 41, 1),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color.fromRGBO(109, 175, 254, 1),
            unselectedItemColor: Colors.white70,
            selectedLabelStyle: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}

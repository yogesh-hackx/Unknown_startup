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
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color.fromRGBO(109, 175, 254, 1),
          ),
          buttonColor: Color.fromRGBO(109, 175, 254, 1),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue[800],
            unselectedItemColor: Colors.grey[700],
            selectedLabelStyle: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
            ),
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => Helper(),
      },
    );
  }
}

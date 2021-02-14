import 'package:application_unknown/firebase/FirebaseMethods.dart';
import 'package:application_unknown/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

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
      Map<String, bool> onlineIndicatorMap = {"isOnline": false};
      FirebaseMethods().updateOnlineIndicator(onlineIndicatorMap);
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => Helper(),
      },
    );
  }
}

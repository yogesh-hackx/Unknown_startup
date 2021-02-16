import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 30,
          elevation: 0,
          title: Text(
            "Settings",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          backgroundColor: const Color.fromRGBO(23, 28, 41, 1),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

import 'package:flutter/material.dart';

class Themes extends StatefulWidget {
  @override
  _ThemesState createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
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
          backgroundColor: const Color.fromRGBO(23, 28, 41, 1),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SwitchListTile(
                value: false,
                onChanged: null,
                title: Text(
                  "Royal blue",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SwitchListTile(
                value: false,
                onChanged: null,
                title: Text(
                  "Royal atmos",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

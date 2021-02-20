import 'package:application_unknown/widgets/themes.dart';
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
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Themes();
              }));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: ListTile(
                  tileColor: Theme.of(context).cardTheme.color,
                  contentPadding: EdgeInsets.all(5),
                  leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context)
                            .floatingActionButtonTheme
                            .backgroundColor,
                        width: 2.5,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.colorize_outlined,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                  title: Text(
                    "Themes",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  subtitle: Text(
                    "Try awesome themes",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

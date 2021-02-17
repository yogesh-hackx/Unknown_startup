import 'package:flutter/material.dart';

class StatusTag extends StatefulWidget {
  @override
  _StatusTagState createState() => _StatusTagState();
}

class _StatusTagState extends State<StatusTag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          titleSpacing: 30,
          elevation: 0,
          title: Text(
            "Notifications",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          backgroundColor: const Color.fromRGBO(23, 28, 41, 1),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ListTile(
                tileColor: const Color.fromRGBO(23, 28, 41, 1),
                contentPadding: EdgeInsets.all(8),
                leading: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(
                        color: Color.fromRGBO(109, 175, 254, 1), width: 2.5),
                  ),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundImage: const AssetImage(
                        "assets/images/pexels-sindre-strøm-1040880.jpg"),
                  ),
                ),
                title: RichText(
                  text: TextSpan(
                    text: 'Abhishek\b',
                    style: Theme.of(context).textTheme.button,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'tagged you in a story',
                          style: Theme.of(context).textTheme.subtitle2),
                    ],
                  ),
                ),
                subtitle: Text(
                  "3 minutes ago",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ListTile(
                tileColor: const Color.fromRGBO(23, 28, 41, 1),
                contentPadding: EdgeInsets.all(8),
                leading: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    border: Border.all(
                        color: Color.fromRGBO(109, 175, 254, 1), width: 2.5),
                  ),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundImage: const AssetImage(
                        "assets/images/pexels-sindre-strøm-1040880.jpg"),
                  ),
                ),
                title: RichText(
                  text: TextSpan(
                    text: 'Chiku\b',
                    style: Theme.of(context).textTheme.button,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'tagged you in a story',
                          style: Theme.of(context).textTheme.subtitle2),
                    ],
                  ),
                ),
                subtitle: Text(
                  "1 hour ago",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          titleSpacing: 30,
          elevation: 0,
          title: Text(
            "Contacts",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
          backgroundColor: const Color.fromRGBO(23, 28, 41, 1),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ListTile(
                tileColor: const Color.fromRGBO(23, 28, 41, 1),
                contentPadding: EdgeInsets.all(5),
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
                title: Text(
                  "Abhishek",
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Text(
                  "EveryTruth will unwrap at some point of time just wait my love..",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ListTile(
                tileColor: const Color.fromRGBO(23, 28, 41, 1),
                contentPadding: EdgeInsets.all(5),
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
                title: Text(
                  "Ashutosh",
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Text(
                  "Existential Crisis",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}

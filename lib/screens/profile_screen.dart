import 'package:application_unknown/widgets/edit_profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            "Profile",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          backgroundColor: const Color.fromRGBO(23, 28, 41, 1),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(23, 28, 41, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(
                            color: Color.fromRGBO(109, 175, 254, 1), width: 4)),
                    child: const CircleAvatar(
                      radius: 75,
                      backgroundImage: const AssetImage(
                          "assets/images/pexels-sindre-strøm-1040880.jpg"),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Mark Spencer",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 2),
                    child: Text(
                      "&UX/UI Developer",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Existential Crisis",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(109, 175, 254, 1),
        child: Icon(Icons.edit_rounded),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EditProfile();
          }));
        },
      ),
    );
  }
}

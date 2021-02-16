import 'package:application_unknown/widgets/image_status.dart';
import 'package:application_unknown/widgets/text_status.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
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
            "Status",
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
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(23, 28, 41, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      border: Border.all(
                          color: Color.fromRGBO(231, 233, 240, 1), width: 3)),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: const AssetImage(
                        "assets/images/pexels-sindre-strøm-1040880.jpg"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Your Status",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TextStatus();
                              }));
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(67, 127, 199, 1),
                                    Color.fromRGBO(109, 175, 254, 1)
                                  ],
                                ),
                              ),
                              child: Icon(
                                Icons.create_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              " Add Text",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ImageStatus();
                              }));
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(67, 127, 199, 1),
                                    Color.fromRGBO(109, 175, 254, 1)
                                  ],
                                ),
                              ),
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Add Media",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
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
                title: Text(
                  "Jennifer Cleo",
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Text(
                  "Yesterday at 12:30pm",
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

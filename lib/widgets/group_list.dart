import 'package:application_unknown/widgets/group_tile.dart';
import 'package:application_unknown/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class GroupList extends StatefulWidget {
  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SearchBar(),
        GroupTile(
          imageUrl: "assets/images/pexels-sindre-strøm-1040880.jpg",
          title: "Racists",
          subTitle: "Sure,no problem",
        ),
        GroupTile(
          imageUrl: "assets/images/pexels-sindre-strøm-1040880.jpg",
          title: "Hold on",
          subTitle: "See you soon Mike",
        ),
        GroupTile(
          imageUrl: "assets/images/pexels-sindre-strøm-1040880.jpg",
          title: "Great people",
          subTitle: "Sure,no problem",
        ),
      ],
      padding: const EdgeInsets.only(right: 10, left: 10),
    );
  }
}

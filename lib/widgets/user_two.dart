import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class User2 extends StatefulWidget {
  final String msg;
  final DateTime timeSent;

  User2({Key key, this.msg, this.timeSent});

  @override
  _User2State createState() => _User2State();
}

class _User2State extends State<User2> {
  var dateFormat = DateFormat.jm();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 250),
            margin: const EdgeInsets.only(bottom: 5, top: 5, right: 3),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(109, 175, 254, 1),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(67, 127, 199, 1),
                  Color.fromRGBO(109, 175, 254, 1)
                ],
              ),
            ),
            child: Text(
              widget.msg,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5, top: 5),
            child: Text(
              dateFormat.format(widget.timeSent),
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}

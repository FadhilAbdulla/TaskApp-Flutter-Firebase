import 'package:flutter/material.dart';

class GreetingHeadBar extends StatefulWidget {
  const GreetingHeadBar({super.key, required this.UserName});

  final String UserName;

  @override
  State<GreetingHeadBar> createState() => _GreetingHeadBar();
}

class _GreetingHeadBar extends State<GreetingHeadBar> {
  final myController = TextEditingController();
  final placeholder = "sample text";

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 70,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good Morning, ${widget.UserName} !',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                        fontSize: 15)),
                Text("Let's start your task",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20)),
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color.fromARGB(89, 197, 197, 197),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
          ],
        ));
  }
}

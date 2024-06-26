import 'package:flutter/material.dart';

class GreetingHeadBar extends StatefulWidget {
  const GreetingHeadBar({super.key, required this.UserName});

  final String UserName;

  @override
  State<GreetingHeadBar> createState() => _GreetingHeadBar();
}

class _GreetingHeadBar extends State<GreetingHeadBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        fontFamily: "Montserrat",
                        fontSize: 13)),
                Text("Let's Start your task",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontSize: 16)),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/notification');
              },
              child: Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 248, 248, 248),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 24.0,
                  semanticLabel: 'Hover to notification',
                ),
              ),
            ),
          ],
        ));
  }
}

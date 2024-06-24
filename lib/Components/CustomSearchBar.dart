import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBar();
}

class _CustomSearchBar extends State<CustomSearchBar> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          color: Color.fromARGB(163, 207, 207, 207),
          borderRadius: BorderRadius.circular(10), // Background color
        ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Colors.black87,
              size: 18.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            TextField(
              controller: myController,
              style: TextStyle(fontSize: 12),
              decoration: (InputDecoration(hintText: "Search your task")),
            )
          ],
        ));
  }
}

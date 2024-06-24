import 'package:flutter/material.dart';

class Normalbutton extends StatefulWidget {
  const Normalbutton({super.key, required this.textinside});

  final String textinside;

  @override
  State<Normalbutton> createState() => _Normalbutton();
}

class _Normalbutton extends State<Normalbutton> {
  final myController = TextEditingController();
  final placeholder = "sample text";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50,
      margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
      decoration: BoxDecoration(
        color: Colors.black, // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Text(widget.textinside,
            style: TextStyle(
              color: Colors.white, // Text color
              fontSize: 15, // Font size
            )),
      ),
    );
  }
}

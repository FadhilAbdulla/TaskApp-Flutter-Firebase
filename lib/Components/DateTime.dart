import 'package:flutter/material.dart';

class DateTime extends StatefulWidget {
  const DateTime({super.key, required this.Date, required this.Day});

  final String Date;
  final String Day;

  @override
  State<DateTime> createState() => _DateTime();
}

class _DateTime extends State<DateTime> {
  final myController = TextEditingController();
  final placeholder = "sample text";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 100,
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.Date,
              style: TextStyle(
                  color: Colors.black, // Text color
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          Text(widget.Day,
              style: TextStyle(
                  color: Colors.black, // Text color
                  fontSize: 28, // F
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

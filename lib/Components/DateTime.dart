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
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.Date,
              style: TextStyle(
                  color: Color.fromARGB(255, 38, 38, 38), // Text color
                  fontSize: 24,
                  fontWeight: FontWeight.w600)),
          Text(widget.Day,
              style: TextStyle(
                  color: Color.fromARGB(255, 38, 38, 38), // Text color
                  fontSize: 24, // F
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

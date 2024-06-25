import 'package:flutter/material.dart';

class TextAreaSimple extends StatefulWidget {
  const TextAreaSimple({super.key, required this.placeholder});

  final String placeholder;

  @override
  State<TextAreaSimple> createState() => _TextAreaSimple();
}

class _TextAreaSimple extends State<TextAreaSimple> {
  final myController = TextEditingController();
  final placeholder = "sample text";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 45,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: TextField(
        controller: myController,
        style: TextStyle(fontSize: 13), // Set font size here

        decoration: InputDecoration(
            hintText: '${widget.placeholder}',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(160, 197, 197, 197),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Color.fromARGB(159, 86, 86, 86),
                width: 1.0,
              ),
            )),
      ),
    );
  }
}

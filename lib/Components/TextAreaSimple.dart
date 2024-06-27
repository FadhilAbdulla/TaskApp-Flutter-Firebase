import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      alignment: Alignment.centerLeft,
      width: 400,
      height: 42,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
      // padding: EdgeInsets.fromLTRB(5, 5, 5, bottom),
      child: TextField(
        controller: myController,
        style: GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500)), // Set font size here

        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            hintText: '${widget.placeholder}',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 222, 222, 222),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 96, 96, 96),
                width: 1.0,
              ),
            )),
      ),
    );
  }
}

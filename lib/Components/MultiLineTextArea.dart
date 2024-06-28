import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MultiLineTextArea extends StatefulWidget {
  const MultiLineTextArea(
      {super.key, required this.HintText, required this.Title});

  final String HintText;
  final String Title;
  @override
  State<MultiLineTextArea> createState() => _MultiLineTextArea();
}

class _MultiLineTextArea extends State<MultiLineTextArea> {
  String? _selectedProject;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.Title,
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(153, 153, 153, 1),
                  fontWeight: FontWeight.w600)),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: TextField(
            maxLines: 3,
            // controller: myController,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(
                        153, 153, 153, 1))), // Set font size here

            decoration: InputDecoration(
                hintText: widget.HintText,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(153, 153, 153, 1),
                    width: 0.5,
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
        ),
      ],
    );
  }
}

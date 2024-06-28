import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalRoudedButton extends StatefulWidget {
  const ModalRoudedButton(
      {super.key, required this.textinside, required this.blackButton});

  final String textinside;
  final bool blackButton;

  @override
  State<ModalRoudedButton> createState() => _ModalRoudedButton();
}

class _ModalRoudedButton extends State<ModalRoudedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 33,
      padding: EdgeInsets.fromLTRB(15, 2, 15, 2),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: widget.blackButton ? Colors.black : Colors.white,
          border:
              Border.all(color: Color.fromARGB(255, 245, 245, 245), width: 1)),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Text(
            widget.textinside,
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: widget.blackButton
                        ? Colors.white
                        : Colors.black)), // Adjust font size as needed
            textAlign: TextAlign.center, // Adjust text alignment as needed
            maxLines: 1, // Ensure text does not wrap
            overflow:
                TextOverflow.ellipsis, // Handle overflow if text is too long
          );
        },
      ),
    );
  }
}

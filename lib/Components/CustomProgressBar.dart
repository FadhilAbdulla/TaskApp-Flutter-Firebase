import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomProgressBar extends StatefulWidget {
  const CustomProgressBar({super.key, required this.Progress});

  final double Progress;
  @override
  State<CustomProgressBar> createState() => _CustomProgressBar();
}

class _CustomProgressBar extends State<CustomProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Progress",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color.fromRGBO(120, 120, 120, 1))),
                  ),
                  Text("${widget.Progress}%",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color.fromRGBO(120, 120, 120, 1)))
                ],
              )),
          LinearProgressIndicator(
            value: widget.Progress / 100,
            color: Colors.black87,
            backgroundColor: Color.fromRGBO(234, 234, 234, 1),
            borderRadius: BorderRadius.circular(8),
            minHeight: 5,
          ),
        ],
      ),
    );
  }
}

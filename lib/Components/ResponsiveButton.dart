import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResponsiveButton extends StatefulWidget {
  const ResponsiveButton(
      {super.key, required this.textinside, required this.blackButton});

  final String textinside;
  final bool blackButton;

  @override
  State<ResponsiveButton> createState() => _ResponsiveButton();
}

class _ResponsiveButton extends State<ResponsiveButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 25,
      padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: widget.blackButton ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black, width: 1)),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Text(
            widget.textinside,
            style: TextStyle(
                fontSize: 12.0,
                color: widget.blackButton
                    ? Colors.white
                    : Colors.black), // Adjust font size as needed
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

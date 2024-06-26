import 'package:flutter/material.dart';

class ResponsiveButton extends StatefulWidget {
  const ResponsiveButton(
      {super.key,
      required this.textinside,
      required this.blackButton,
      this.onButtonTap});

  final String textinside;
  final bool blackButton;
  final VoidCallback? onButtonTap;

  @override
  State<ResponsiveButton> createState() => _ResponsiveButton();
}

class _ResponsiveButton extends State<ResponsiveButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onButtonTap!();
      },
      child: Container(
        alignment: Alignment.center,
        height: 42,
        padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: widget.blackButton ? Colors.black : Colors.white,
            border: Border.all(color: Colors.black, width: 1)),
        child: Text(
          widget.textinside,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: widget.blackButton
                  ? Colors.white
                  : Colors.black), // Adjust font size as needed
          textAlign: TextAlign.center, // Adjust text alignment as needed
          maxLines: 1, // Ensure text does not wrap
          overflow:
              TextOverflow.ellipsis, // Handle overflow if text is too long
        ),
      ),
    );
  }
}

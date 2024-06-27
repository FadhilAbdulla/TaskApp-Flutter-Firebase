import 'package:flutter/material.dart';

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
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Progress",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color.fromARGB(225, 120, 120, 120)),
                  ),
                  Text("${widget.Progress}%",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: const Color.fromARGB(225, 120, 120, 120)))
                ],
              )),
          LinearProgressIndicator(
            value: widget.Progress / 100,
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}

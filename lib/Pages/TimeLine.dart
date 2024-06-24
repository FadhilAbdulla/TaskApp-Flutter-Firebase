import 'package:flutter/material.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({
    super.key,
  });
  @override
  State<TimeLine> createState() => _TimeLine();
}

class _TimeLine extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text("Time Line"));
  }
}

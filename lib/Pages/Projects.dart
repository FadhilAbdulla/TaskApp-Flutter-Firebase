import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({
    super.key,
  });
  @override
  State<Projects> createState() => _Projects();
}

class _Projects extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text("Projects"));
  }
}

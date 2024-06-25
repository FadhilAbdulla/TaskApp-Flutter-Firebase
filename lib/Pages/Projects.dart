import 'package:flutter/material.dart';
import '../Components/ProjectListView.dart';

class Projects extends StatefulWidget {
  const Projects({
    super.key,
  });
  @override
  State<Projects> createState() => _Projects();
}

class _Projects extends State<Projects> {
  final List<Map> items = [
    {
      "ImageUrl": "https://picsum.photos/200/300",
      "ProjectName": "Disk Task Management App",
      "Description": "Redesign fashion app for up dribble",
      "Priority": "High",
      "Status": "Completed",
      "Progress": "64",
      "UserImages": [
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300"
      ]
    },
    {
      "ImageUrl": "https://picsum.photos/200/300",
      "ProjectName": "Disk Task Management App",
      "Description": "Redesign fashion app for up dribble",
      "Priority": "High",
      "Status": "Completed",
      "Progress": "64",
      "UserImages": [
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300"
      ]
    },
    {
      "ImageUrl": "https://picsum.photos/200/300",
      "ProjectName": "Disk Task Management App",
      "Description": "Redesign fashion app for up dribble",
      "Priority": "High",
      "Status": "Completed",
      "Progress": "64",
      "UserImages": [
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300"
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: ProjectListView(
        ProjectList: [items[0], items[2]],
      ),
    ));
  }
}

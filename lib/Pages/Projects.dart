import 'package:flutter/material.dart';
import '../Components/ProjectListView.dart';
import '../Components/CustomSearchBar.dart';
import '../Components//DefaultHeader.dart';

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
      "Status": "InProgress",
      "Progress": 100.0,
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
      "Status": "ToDo",
      "Progress": 80.0,
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
      "Status": "ToDo",
      "Progress": 64.0,
      "UserImages": [
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300"
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: DefaultHeader(
          BackButtonPresent: true,
          SettingsButtonPresent: false,
          header: "Projects",
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: CustomSearchBar(),
        ),
      ),
      body: Center(
        child: ProjectListView(
          ProjectList: [
            items[0],
            items[2],
          ],
        ),
      ),
    );
  }
}

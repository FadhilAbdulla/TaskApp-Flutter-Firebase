import 'package:flutter/material.dart';
import '../Components/TimeLineListView.dart';
import '../Components/DateTime.dart';
import '../Components/DefaultHeader.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({
    super.key,
  });
  @override
  State<TimeLine> createState() => _TimeLine();
}

class _TimeLine extends State<TimeLine> {
  final List<Map> items = [
    {
      "ImageUrl": "https://picsum.photos/200/300",
      "ProjectName": "Disk Task Management App",
      "Description": "Redesign fashion app for up dribble",
      "Priority": "High",
      "Status": "Completed",
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
      "Status": "Completed",
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
      "Status": "Completed",
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
        title: DefaultHeader(
          BackButtonPresent: true,
          SettingsButtonPresent: false,
          header: "Time Line",
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: DateTime(Date: "May,18", Day: "24,Tusday"),
        ),
      ),
      body: Center(
        child: TimeLineListView(
          ProjectList: [
            items[0],
            items[2],
          ],
        ),
      ),
    );
  }
}

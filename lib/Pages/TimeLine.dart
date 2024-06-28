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
      "id": "1",
      "ImageUrl": "https://picsum.photos/200/300",
      "ProjectName": "Disk Task Management App",
      "Description": "Redesign fashion app for up dribble",
      "Status": "Completed",
      "Progress": 80.0,
      "UserImages": [
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300"
      ],
      "Events": [
        {
          "Title": "Meeting with Client",
          "Priority": "High",
          "Time": "11:00",
          "LinkToCopy": "www.sample.com"
        },
        {
          "Title": "Meeting with Client",
          "Priority": "High",
          "Time": "11:00",
          "LinkToCopy": "www.sample.com"
        }
      ]
    },
    {
      "id": "2",
      "ImageUrl": "https://picsum.photos/200/300",
      "ProjectName": "Disk Task Management App",
      "Description": "Redesign fashion app for up dribble",
      "Status": "Completed",
      "Progress": 80.0,
      "UserImages": [
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300"
      ],
      "Events": [
        {
          "Title": "Meeting with Client",
          "Priority": "High",
          "Time": "11:00",
          "LinkToCopy": "www.sample.com"
        },
        {
          "Title": "Meeting with Client",
          "Priority": "High",
          "Time": "11:00",
          "LinkToCopy": "www.sample.com"
        }
      ]
    },
    {
      "id": "3",
      "ImageUrl": "https://picsum.photos/200/300",
      "ProjectName": "Disk Task Management App",
      "Description": "Redesign fashion app for up dribble",
      "Status": "Completed",
      "Progress": 80.0,
      "UserImages": [
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300"
      ],
      "Events": [
        {
          "Title": "Meeting with Client",
          "Priority": "High",
          "Time": "11:00",
          "LinkToCopy": "www.sample.com"
        },
        {
          "Title": "Meeting with Client",
          "Priority": "High",
          "Time": "11:00",
          "LinkToCopy": "www.sample.com/sampe/sam,plezdsafygdskuy"
        }
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
          header: "Time Line",
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: DateTime(Date: "May,18", Day: "24,Tusday"),
        ),
      ),
      body: Center(
        child: TimeLineListView(
          ProjectList: [
            items[0],
            items[2],
            items[1],
          ],
        ),
      ),
    );
  }
}

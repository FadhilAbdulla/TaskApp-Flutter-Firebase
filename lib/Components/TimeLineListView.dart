import 'package:flutter/material.dart';
import './ProfileImageAvatar.dart';
import './ImageOverlap.dart';
import './CustomProgressBar.dart';

class TimeLineListView extends StatefulWidget {
  const TimeLineListView({super.key, required this.ProjectList});

  final List<Map> ProjectList;

  @override
  State<TimeLineListView> createState() => _TimeLineListView();
}

class _TimeLineListView extends State<TimeLineListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.ProjectList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5, // Elevation controls the shadow depth
          shadowColor: Colors.grey.withOpacity(0.5), // Shadow color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.symmetric(
              vertical: 8.0, horizontal: 20.0), // Margin around each card
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(children: <Widget>[
                        ProfileImageAvatar(
                          imageUrl: widget.ProjectList[index]["ImageUrl"],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.ProjectList[index]["ProjectName"],
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        )
                      ]),
                      Container(child: Icon(Icons.settings))
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                      child: Text(widget.ProjectList[index]["Description"],
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14))),
                  ImageOverlap(
                      ImageUrlList: widget.ProjectList[index]["UserImages"]),
                  SizedBox(
                    height: 10,
                  ),
                  CustomProgressBar(
                    Progress: widget.ProjectList[index]["Progress"],
                  )
                ]),
          ),
        );
      },
    );
  }
}

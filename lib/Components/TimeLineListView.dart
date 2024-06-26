import 'package:flutter/material.dart';
import './ProfileImageAvatar.dart';
import './ImageOverlap.dart';
import './CustomProgressBar.dart';
import './IndividualTask.dart';

class TimeLineListView extends StatefulWidget {
  const TimeLineListView({super.key, required this.ProjectList});

  final List<Map> ProjectList;

  @override
  State<TimeLineListView> createState() => _TimeLineListView();
}

class _TimeLineListView extends State<TimeLineListView> {
  String? OpenedTimeLine;

  void ClickedTimeLine(id) {
    setState(() {
      OpenedTimeLine = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.ProjectList.length,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  ClickedTimeLine(widget.ProjectList[index]["id"]);
                },
                child: Card(
                  elevation: 5, // Elevation controls the shadow depth
                  shadowColor: Colors.grey.withOpacity(0.5), // Shadow color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 20.0), // Margin around each card
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                widget.ProjectList[index]["ProjectName"],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                                ),
                                child: Icon(
                                  Icons.more_horiz,
                                  color: Colors.black,
                                  size: 16.0,
                                ),
                              )
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                              child: Text(
                                  widget.ProjectList[index]["Description"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12))),
                          ImageOverlap(
                              ImageUrlList: widget.ProjectList[index]
                                  ["UserImages"]),
                          SizedBox(
                            height: 10,
                          ),
                          CustomProgressBar(
                            Progress: widget.ProjectList[index]["Progress"],
                          )
                        ]),
                  ),
                ),
              ),
              if (widget.ProjectList[index]["id"] == OpenedTimeLine)
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    children: [
                      IndividualTask(
                          EventData: widget.ProjectList[index]["Events"][0]),
                      IndividualTask(
                          EventData: widget.ProjectList[index]["Events"][1]),
                    ],
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}

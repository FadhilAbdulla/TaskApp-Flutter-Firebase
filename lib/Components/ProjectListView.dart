import 'package:flutter/material.dart';
import './ProfileImageAvatar.dart';
import './ImageOverlap.dart';
import './CustomProgressBar.dart';

class ProjectListView extends StatefulWidget {
  const ProjectListView({super.key, required this.ProjectList});

  final List<Map> ProjectList;

  @override
  State<ProjectListView> createState() => _ProjectListView();
}

class _ProjectListView extends State<ProjectListView> {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        padding: EdgeInsets.all(4),
                        height: 28,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 0.5,
                            color: Colors.black,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.red),
                            ),
                            Text(
                              "${widget.ProjectList[index]["Priority"]} priority",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Text("pending")
                    ],
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

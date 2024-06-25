import 'package:flutter/material.dart';
import './ProfileImageAvatar.dart';
import './ImageOverlap.dart';
import './CustomProgressBar.dart';
import 'ResponsiveButton.dart';

class NotificationListView extends StatefulWidget {
  const NotificationListView({super.key, required this.ProjectList});

  final List<Map> ProjectList;

  @override
  State<NotificationListView> createState() => _NotificationListView();
}

class _NotificationListView extends State<NotificationListView> {
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
                  Row(children: <Widget>[
                    ProfileImageAvatar(
                      imageUrl: widget.ProjectList[index]["ImageUrl"],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.ProjectList[index]["NotificationName"],
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    )
                  ]),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(widget.ProjectList[index]["Description"],
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14))),
                  Divider(
                    color: const Color.fromARGB(255, 224, 224, 224),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text("Link Preview",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14))),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 2, 0, 15),
                      child: Text(widget.ProjectList[index]["LinkDescription"],
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12))),
                  Row(
                    children: [
                      ResponsiveButton(
                        textinside: "Approve",
                        blackButton: true,
                      ),
                      ResponsiveButton(
                        textinside: "Deny",
                        blackButton: false,
                      )
                    ],
                  ),
                ]),
          ),
        );
      },
    );
  }
}

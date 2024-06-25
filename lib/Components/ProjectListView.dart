import 'package:flutter/material.dart';
import './ProfileImageAvatar.dart';

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
            padding: EdgeInsets.all(6.0),
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
                        Text(widget.ProjectList[index]["ProjectName"])
                      ]),
                      Container(child: Icon(Icons.settings))
                    ],
                  ),
                  Text(widget.ProjectList[index]["Description"]),
                  Positioned(
                    child: ProfileImageAvatar(
                      imageUrl: widget.ProjectList[index]["ImageUrl"],
                    ),
                  ),
                ]),
          ),
        );
      },
    );
  }
}

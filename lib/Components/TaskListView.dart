import 'package:flutter/material.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListView();
}

class _TaskListView extends State<TaskListView> {
  final myController = TextEditingController();
  final placeholder = "sample text";
  final List<Map> items = [
    {
      "Category": "Ui Ux Design",
      "Name": "Disk Task Management App",
      "Description": "Redesign fashion app for up dribble",
      "Date": "Today 10:00AM",
      "Duration": "5",
      "Status": "Completed"
    },
    {
      "Category": "Mobile Developing",
      "Name": "Ios Mobile Application",
      "Description": "sample Redesign fashion app for up dribble",
      "Date": "Today 5:00AM",
      "Duration": "4",
      "Status": "InProgress"
    },
    {
      "Category": "Web developing",
      "Name": "Web Application deployment",
      "Description": "Redesign fashion app for up dribble",
      "Date": "Today 9:00AM",
      "Duration": "4.5",
      "Status": "ToDo"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(99, 209, 209, 209),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: EdgeInsets.all(6.0),
                  margin: EdgeInsets.fromLTRB(18, 18, 0, 0), // Background color
                  child: Text(
                    items[index]["Category"],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                ListTile(
                  title: Text(items[index]["Name"],
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                  subtitle: Text(
                    items[index]["Description"],
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
                  ),
                  trailing: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50.0)),
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        items[index]["Status"] == "ToDo"
                            ? Icons.play_arrow
                            : items[index]["Status"] == "InProgress"
                                ? Icons.pause
                                : items[index]["Status"] == "Completed"
                                    ? Icons.done
                                    : Icons.close,
                        color: Colors.white,
                        size: 15,
                      )),
                ),
                Divider(
                  indent: 18,
                  endIndent: 18,
                  color: const Color.fromARGB(255, 224, 224, 224),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(18, 5, 18, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        items[index]["Date"],
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                      Text(
                        "${items[index]["Duration"]} Hours",
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

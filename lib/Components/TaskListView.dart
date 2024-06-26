import 'package:flutter/material.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key, required this.TaskList});

  final List<Map> TaskList;

  @override
  State<TaskListView> createState() => _TaskListView();
}

class _TaskListView extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.TaskList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/managetask');
          },
          child: Card(
            elevation: 5, // Elevation controls the shadow depth
            shadowColor: Colors.grey.withOpacity(0.5), // Shadow color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 20.0), // Margin around each card
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(150, 238, 238, 238),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    padding: EdgeInsets.all(6.0),
                    margin:
                        EdgeInsets.fromLTRB(18, 18, 0, 0), // Background color
                    child: Text(
                      widget.TaskList[index]["Category"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    title: Text(widget.TaskList[index]["Name"],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                    subtitle: Text(
                      widget.TaskList[index]["Description"],
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                    trailing: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50.0)),
                        padding: EdgeInsets.all(3),
                        child: Icon(
                          widget.TaskList[index]["Status"] == "ToDo"
                              ? Icons.play_arrow
                              : widget.TaskList[index]["Status"] == "InProgress"
                                  ? Icons.pause
                                  : widget.TaskList[index]["Status"] ==
                                          "Completed"
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
                          widget.TaskList[index]["Date"],
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${widget.TaskList[index]["Duration"]} Hours",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

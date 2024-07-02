import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskListView extends StatefulWidget {
  const TaskListView(
      {super.key, required this.TaskList, required this.IsToday});

  final List<Map> TaskList;
  final bool IsToday;

  @override
  State<TaskListView> createState() => _TaskListView();
}

class _TaskListView extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 8),
      itemCount: widget.TaskList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(
              '/managetask',
              arguments: widget.TaskList[index],
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(0, 188, 196, 207).withOpacity(0.5),
                  spreadRadius: -4,

                  blurRadius: 40,
                  offset: Offset(0, 12), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 24,
                    padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 238, 238),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    margin:
                        EdgeInsets.fromLTRB(18, 18, 0, 0), // Background color
                    child: Text(
                      widget.TaskList[index]["Category"],
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 18, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.TaskList[index]["Name"],
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ))),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.TaskList[index]["Description"],
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12)),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50.0)),
                          padding: EdgeInsets.all(3),
                          child: Icon(
                            widget.TaskList[index]["Status"] == "ToDo"
                                ? Icons.play_arrow
                                : widget.TaskList[index]["Status"] ==
                                        "InProgress"
                                    ? Icons.pause
                                    : widget.TaskList[index]["Status"] ==
                                            "Completed"
                                        ? Icons.done
                                        : Icons.close,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical:
                            0), // Set padding to 0 to remove default padding

                    child: Divider(
                      indent: 18,
                      endIndent: 18,
                      color: const Color.fromARGB(255, 224, 224, 224),
                    ),
                  ),
                  widget.IsToday == true
                      ? Container(
                          padding: EdgeInsets.fromLTRB(18, 0, 18, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                widget.TaskList[index]["Date"],
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 87, 87, 87),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Text(
                                "${widget.TaskList[index]["Hours"]} Hours",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 87, 87, 87),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                              )
                            ],
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.fromLTRB(18, 0, 18, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                widget.TaskList[index]["CompletedDate"],
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 87, 87, 87),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Text(
                                "${widget.TaskList[index]["Points"]} Points",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 87, 87, 87),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Text(
                                "${widget.TaskList[index]["Hours"]} Hours",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 87, 87, 87),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
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

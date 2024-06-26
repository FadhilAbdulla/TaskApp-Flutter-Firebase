import 'package:flutter/material.dart';

class TaskManagerBody extends StatefulWidget {
  const TaskManagerBody({
    super.key,
    required this.TaskDetails,
  });

  final Map TaskDetails;
  @override
  State<TaskManagerBody> createState() => _TaskManagerBody();
}

class _TaskManagerBody extends State<TaskManagerBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Project Name",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.TaskDetails["ProjectName"],
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          color: const Color.fromARGB(255, 224, 224, 224),
        ),
        SizedBox(
          height: 5,
        ),
        Text("Task Details",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.TaskDetails["TaskDetails"],
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          color: const Color.fromARGB(255, 224, 224, 224),
        ),
        SizedBox(
          height: 5,
        ),
        Text("Description",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.TaskDetails["Description"],
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          color: const Color.fromARGB(255, 224, 224, 224),
        ),
        SizedBox(
          height: 5,
        ),
        widget.TaskDetails["Status"] == "Completed"
            ? Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color.fromARGB(255, 230, 230, 230)),
                          height: 123,
                          width: 123,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.TaskDetails["Points"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18)),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Points",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14)),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color.fromARGB(255, 230, 230, 230)),
                          height: 123,
                          width: 123,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.TaskDetails["Hours"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18)),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Hours",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14)),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color.fromARGB(255, 230, 230, 230)),
                          height: 123,
                          width: 123,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Approved",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18)),
                              SizedBox(
                                height: 5,
                              ),
                              Text(widget.TaskDetails["Approved"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14)),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Color.fromARGB(255, 230, 230, 230)
                          ),
                          height: 90,
                          width: 90,
                          // child: Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text(widget.TaskDetails["Hours"],
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.w600,
                          //             fontSize: 14)),
                          //     SizedBox(
                          //       height: 5,
                          //     ),
                          //     Text("Hours",
                          //         style: TextStyle(
                          //             fontWeight: FontWeight.w300,
                          //             fontSize: 12)),
                          //   ],
                          // ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text("Start date",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 14)),
                            SizedBox(
                              height: 5,
                            ),
                            Text(widget.TaskDetails["StartDate"],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15)),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text("Start time",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(widget.TaskDetails["StartTime"],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: const Color.fromARGB(255, 224, 224, 224),
                  ),
                ],
              ),
      ],
    );
  }
}

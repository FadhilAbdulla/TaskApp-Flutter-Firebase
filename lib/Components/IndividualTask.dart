import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IndividualTask extends StatefulWidget {
  const IndividualTask({super.key, required this.EventData});
  final Map EventData;
  @override
  State<IndividualTask> createState() => _IndividualTask();
}

class _IndividualTask extends State<IndividualTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 1, // Spread radius
            blurRadius: 5, // Blur radius
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
      // elevation: 5, // Elevation controls the shadow depth
      //   shadowColor: Colors.grey.withOpacity(0.5), // Shadow colo
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
                  Expanded(
                    child: Text(
                      widget.EventData["Title"],
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                    ),
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
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Time",
                    style: TextStyle(
                        color: Color.fromARGB(255, 159, 159, 159),
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                  ),
                  Text(
                    widget.EventData["Time"],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                height: 26,
                width: 95,
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
                      "${widget.EventData["Priority"]} priority",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(255, 234, 234, 234)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 110),
                      child: Text(widget.EventData["LinkToCopy"],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 11),
                          overflow: TextOverflow.ellipsis),
                    ),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                            text: widget.EventData["LinkToCopy"]));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Link copied to clipboard')),
                        );
                      },
                      child: Icon(
                        Icons.copy_outlined,
                        size: 14,
                      ),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}

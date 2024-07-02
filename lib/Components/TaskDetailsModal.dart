import 'package:flutter/material.dart';
import 'CustomDropDown.dart';
import 'MultiLineTextArea.dart';
import 'Counter.dart';
import 'Normalbutton.dart';
import 'CalenderView.dart';
import '../Functions/ApiFunctions.dart';
import '../Components/NewTaskModal.dart';

class TaskDetailsModal extends StatefulWidget {
  const TaskDetailsModal({super.key, required this.taskDetails});

  final Map? taskDetails;

  @override
  State<TaskDetailsModal> createState() => _TaskDetailsModal();
}

class _TaskDetailsModal extends State<TaskDetailsModal> {
  void deletetaskButtonClicked() async {
    final response = await DeleteTaskDetails(taskId: widget.taskDetails!["id"]);
    if (response["status"] == "200") {
      Navigator.pop(context);
      Navigator.of(context).pushReplacementNamed('/');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Task deleted successfully')),
      );
    } else {
      SnackBar(content: Text(response["message"]));
    }
  }

  void navigateToEditPage() {
    Navigator.pop(context);
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return NewTaskModal(
            EditView: true,
            Category: widget.taskDetails!["Category"],
            TaskName: widget.taskDetails!["Name"],
            TaskPoints: widget.taskDetails!["Points"],
            TaskHours: widget.taskDetails!["Hours"],
            Description: widget.taskDetails!["Description"],
            TaskDate: widget.taskDetails!["Date"],
            TaskId: widget.taskDetails!["id"]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width,
      height: 228,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.close,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: navigateToEditPage,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 10),
                      Icon(
                        Icons.edit,
                        size: 20.0,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Edit task",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Divider(
                  color: const Color.fromARGB(255, 224, 224, 224),
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Icon(
                      Icons.file_copy,
                      size: 20.0,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Duplicate Task",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Divider(
                  color: const Color.fromARGB(255, 224, 224, 224),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: deletetaskButtonClicked,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 10),
                      Icon(
                        Icons.delete_outline,
                        size: 20.0,
                        color: Colors.red,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Delete",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'CustomDropDown.dart';
import 'MultiLineTextArea.dart';
import 'Counter.dart';
import 'Normalbutton.dart';
import 'CalenderView.dart';
import 'ModalRoudedButton.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Functions/ApiFunctions.dart';

class NewTaskModal extends StatefulWidget {
  const NewTaskModal({
    super.key,
    required this.EditView,
    this.Category,
    this.TaskName,
    this.TaskPoints,
    this.TaskHours,
    this.Description,
    this.TaskDate,
    this.TaskId,
  });

  final String? Category;
  final String? TaskName;
  final String? TaskPoints;
  final String? TaskHours;
  final String? Description;
  final String? TaskDate;
  final String? TaskId;

  final bool EditView;
  @override
  State<NewTaskModal> createState() => _NewTaskModal();
}

class _NewTaskModal extends State<NewTaskModal> {
  bool _ShowCalender = false;
  List<String> ProjectList = [
    "Ui Ux Design",
    "Mobile Developing",
    "Web developing",
    "DevOps"
  ];
  List<String> TaskList = [
    "Disk Task Management App",
    "Ios Mobile Application",
    "Web Application deployment",
    "CI/CD Implementation"
  ];
  String? _Project = "";
  String? _Tasks = "";
  String? _Hours = "";
  String? _Points = "";
  final DescriptionController = TextEditingController();
  String DateSelected = "Today";
  DateTime dateTopass = DateTime.now();

  void ProjectDropdownvalueChanged(String? DataChange) {
    setState(() {
      _Project = DataChange;
    });
  }

  void TaskDropdownvalueChanged(String? DataChange) {
    setState(() {
      _Tasks = DataChange;
    });
  }

  void HoursValueChange(String? DataChange) {
    setState(() {
      _Hours = DataChange;
    });
  }

  void PointsValueChange(String? DataChange) {
    setState(() {
      _Points = DataChange;
    });
  }

  void ChangeCalenderVisibility() {
    setState(() {
      _ShowCalender = !_ShowCalender;
    });
  }

  void OnDateButtonClicked(String ButtonName) {
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    setState(() {
      DateSelected = ButtonName;
      if (ButtonName == "Today") {
        dateTopass = now;
      } else if (ButtonName == "Yesterday") {
        dateTopass = yesterday;
      } else if (ButtonName == "Tomorrow") {
        dateTopass = tomorrow;
      }
    });
  }

  void formatDate(DateTime date) {
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      setState(() {
        DateSelected = "Today";
      });
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      setState(() {
        DateSelected = "Yesterday";
      });
    } else if (date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day) {
      setState(() {
        DateSelected = "Tomorrow";
      });
    } else {
      setState(() {
        DateSelected = '${date.month} ${date.day}-${date.year}';
      });
      return;
    }
  }

  void callenderDateChange(DateTime? DataChange) {
    if (DataChange != null) {
      formatDate(DataChange);
      setState(() {
        dateTopass = DataChange;
      });
    }
  }

  void CreateNewTask() async {
    final response = await addNewTask(
      Category: _Project ?? "",
      TaskName: _Tasks ?? "",
      TaskPoints: _Points ?? "",
      TaskHours: _Hours ?? "",
      TaskDate: dateTopass,
      Description: DescriptionController.text,
      // StartDate : ""
    );
    if (response["status"] == "200") {
      Navigator.pop(context);
      Navigator.of(context).pushReplacementNamed('/');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Added New task')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response["message"])));
    }
  }

  void UpdateTask() async {
    final response = await updateTask(
      taskId: widget.TaskId ?? "",
      Category: _Project ?? "",
      TaskName: _Tasks ?? "",
      TaskPoints: _Points ?? "",
      TaskHours: _Hours ?? "",
      TaskDate: dateTopass,
      Description: DescriptionController.text,
      // StartDate : ""
    );
    if (response["status"] == "200") {
      Navigator.pop(context);
      Navigator.of(context).pushReplacementNamed('/');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Updated task')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response["message"])));
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.EditView) {
      setState(() {
        _Project = widget.Category;
        _Tasks = widget.TaskName;
        _Hours = widget.TaskHours;
        _Points = widget.TaskPoints;
        //need to add date
      });
      DescriptionController.text = widget.Description!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .922,
      padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.8,
                  ),
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text('${widget.EditView ? "Edit" : "New"} Task',
                style: GoogleFonts.montserrat(
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        OnDateButtonClicked("Yesterday");
                      },
                      child: ModalRoudedButton(
                          blackButton: DateSelected == "Yesterday",
                          textinside: "Yesterday"),
                    ),
                    InkWell(
                        onTap: () {
                          OnDateButtonClicked("Today");
                        },
                        child: ModalRoudedButton(
                            blackButton: DateSelected == "Today",
                            textinside: "Today")),
                    InkWell(
                      onTap: () {
                        OnDateButtonClicked("Tomorrow");
                      },
                      child: ModalRoudedButton(
                          blackButton: DateSelected == "Tomorrow",
                          textinside: "Tomorrow"),
                    ),
                  ],
                ),
                InkWell(
                    onTap: () {
                      ChangeCalenderVisibility();
                    },
                    child: Image.asset(
                      "assets/Images/Icons/Calender.png",
                      width: 23,
                      height: 23,
                    ))
              ],
            ),
            _ShowCalender
                ? CalenderView(
                    onCalenderdateChange: callenderDateChange,
                  )
                : SizedBox(
                    height: 15,
                  ),
            CustomDropDown(
                ListItem: ProjectList,
                Title: "Project",
                onSelectionChanged: ProjectDropdownvalueChanged,
                defaultValue: _Project),
            SizedBox(
              height: 15,
            ),
            CustomDropDown(
                ListItem: TaskList,
                Title: "Task",
                onSelectionChanged: TaskDropdownvalueChanged,
                defaultValue: _Tasks),
            SizedBox(
              height: 14,
            ),
            MultiLineTextArea(
                Title: "Task Description",
                HintText: "Add Description...",
                TextContoller: DescriptionController),
            SizedBox(
              height: 13,
            ),
            Counter(
                Title: "Select hours",
                DataChange: HoursValueChange,
                defaultValue: _Hours),
            SizedBox(
              height: 15,
            ),
            Counter(
                Title: "Task Points",
                DataChange: PointsValueChange,
                defaultValue: _Points),
            SizedBox(
              height: 75,
            ),
            Center(
              child: Normalbutton(
                  textinside: widget.EditView ? "Update" : "Create",
                  ButtonPressed: widget.EditView ? UpdateTask : CreateNewTask),
            ),
          ],
        ),
      ),
    );
  }
}

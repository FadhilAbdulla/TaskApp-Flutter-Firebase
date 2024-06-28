import 'package:flutter/material.dart';
import 'CustomDropDown.dart';
import 'MultiLineTextArea.dart';
import 'Counter.dart';
import 'Normalbutton.dart';
import 'CalenderView.dart';
import 'ModalRoudedButton.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTaskModal extends StatefulWidget {
  const NewTaskModal({super.key});

  @override
  State<NewTaskModal> createState() => _NewTaskModal();
}

class _NewTaskModal extends State<NewTaskModal> {
  bool _ShowCalender = false;
  List<String> ProjectList = ["Project1", "Project2", "Project3", "Project4"];
  List<String> TaskList = ["Task1", "Task2", "Task3", "Task4"];

  void ChangeCalenderVisibility() {
    setState(() {
      _ShowCalender = !_ShowCalender;
    });
  }

  void CreateNewTask() {
    Navigator.pop(context);
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
            Text('New Task',
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
                    ModalRoudedButton(
                        blackButton: false, textinside: "Yesterday"),
                    ModalRoudedButton(blackButton: true, textinside: "Today"),
                    ModalRoudedButton(
                        blackButton: false, textinside: "Tomorrow"),
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
                ? CalenderView()
                : SizedBox(
                    height: 15,
                  ),
            CustomDropDown(ListItem: ProjectList, Title: "Project"),
            SizedBox(
              height: 15,
            ),
            CustomDropDown(ListItem: TaskList, Title: "Task"),
            SizedBox(
              height: 14,
            ),
            MultiLineTextArea(
                Title: "Task Description", HintText: "Add Description..."),
            SizedBox(
              height: 13,
            ),
            Counter(Title: "Select hours"),
            SizedBox(
              height: 15,
            ),
            Counter(Title: "Task Points"),
            SizedBox(
              height: 75,
            ),
            Center(
              child: Normalbutton(
                  textinside: "Create", ButtonPressed: CreateNewTask),
            ),
          ],
        ),
      ),
    );
  }
}

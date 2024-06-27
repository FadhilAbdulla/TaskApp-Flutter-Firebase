import 'package:flutter/material.dart';
import 'CustomDropDown.dart';
import 'MultiLineTextArea.dart';
import 'Counter.dart';
import 'Normalbutton.dart';
import 'CalenderView.dart';
import 'ModalRoudedButton.dart';

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
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .90,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
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
            SizedBox(
              height: 8,
            ),
            const Text(
              'New Task',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
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
                    child: Icon(Icons.calendar_month_outlined))
              ],
            ),
            _ShowCalender
                ? CalenderView()
                : SizedBox(
                    height: 20,
                  ),
            CustomDropDown(ListItem: ProjectList, Title: "Project"),
            SizedBox(
              height: 10,
            ),
            CustomDropDown(ListItem: TaskList, Title: "Task"),
            SizedBox(
              height: 10,
            ),
            MultiLineTextArea(
                Title: "Task Description", HintText: "Add Description..."),
            SizedBox(
              height: 15,
            ),
            Counter(Title: "Select hours"),
            SizedBox(
              height: 15,
            ),
            Counter(Title: "Task Points"),
            SizedBox(
              height: 15,
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

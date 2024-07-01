import 'package:flutter/material.dart';
import '../Components//DefaultHeader.dart';
import '../Components/TaskManagerBody.dart';
import '../Components/TaskDetailsModal.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({
    super.key,
  });

  @override
  State<TaskManager> createState() => _TaskManager();
}

class _TaskManager extends State<TaskManager> {
  // final Map items = {
  //   "Category": "Web developing",
  //   "Name": "Web Application deployment",
  //   "Description": "sample Redesign fashion app for up dribble",
  //   "CompletedDate": "Apr 20-2024 , 10:00 am",
  //   "Points": "5.5",
  //   "Date": "Today 9:00AM",
  //   "Duration": "4",
  //   "Status": "ToDo",
  //   "ProjectName": "Mvp Task manager",
  //   "PrimeDescription":
  //       "Design Task management App Design Task management AppDesign Task management AppDesign Task management AppDesign Task management AppDesign Task management",
  //   "StartDate": "4Apr2024",
  //   "StartTime": "04:45Pm",
  //   "Hours": "10",
  //   "Approved": "Ali"
  // };

  OpenDialogueBox() {
    showModalBottomSheet<void>(
      context: context,
      // isScrollControlled: true,
      builder: (BuildContext context) {
        return TaskDetailsModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map? items = ModalRoute.of(context)?.settings.arguments as Map?;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: DefaultHeader(
          BackButtonPresent: true,
          SettingsButtonPresent: true,
          header: "",
          onSettingsTap: OpenDialogueBox,
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: TaskManagerBody(TaskDetails: items)),
    );
  }
}

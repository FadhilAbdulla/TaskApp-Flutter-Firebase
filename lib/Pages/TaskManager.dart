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
  final Map items = {
    "ProjectName": "Mvp Task manager",
    "TaskDetails": "Design Task management App",
    "Description":
        "Design Task management App Design Task management AppDesign Task management AppDesign Task management AppDesign Task management AppDesign Task management",
    "StartDate": "4Apr2024",
    "StartTime": "04:45Pm",
    "Status": "Completed", // "Completed",
    "Points": "20",
    "Hours": "10",
    "Approved": "Ali"
  };

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

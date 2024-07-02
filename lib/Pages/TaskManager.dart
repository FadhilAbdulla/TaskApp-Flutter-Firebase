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
  OpenDialogueBox(Map? items) {
    showModalBottomSheet<void>(
      context: context,
      // isScrollControlled: true,
      builder: (BuildContext context) {
        return TaskDetailsModal(
          taskDetails: items,
        );
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
          onSettingsTap: () {
            OpenDialogueBox(items);
          },
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: TaskManagerBody(TaskDetails: items)),
    );
  }
}

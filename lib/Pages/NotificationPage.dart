import 'package:flutter/material.dart';
import '../Components//DefaultHeader.dart';
import '../Components/NotificationListView.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({
    super.key,
  });
  @override
  State<NotificationPage> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage> {
  final List<Map> items = [
    {
      "ImageUrl": "https://picsum.photos/200/300",
      "NotificationName": "Araby Ai",
      "Description": "Task Planner App with clean and modern...",
      "Link": "https://picsum.photos/200/300",
      "LinkDescription": "www.update username home and profile,edit password",
      "ApproveButton": true,
      "DenyButton": true
    },
    {
      "ImageUrl": "https://picsum.photos/200/300",
      "NotificationName": "Araby Ai",
      "Description": "Task Planner App with clean and modern...",
      "Link": "https://picsum.photos/200/300",
      "LinkDescription": "www.update username home and profile,edit password",
      "ApproveButton": true,
      "DenyButton": true
    },
    {
      "ImageUrl": "https://picsum.photos/200/300",
      "NotificationName": "Araby Ai",
      "Description": "Task Planner App with clean and modern...",
      "Link": "https://picsum.photos/200/300",
      "LinkDescription": "www.update username home and profile,edit password",
      "ApproveButton": true,
      "DenyButton": true
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: DefaultHeader(
          BackButtonPresent: true,
          SettingsButtonPresent: false,
          header: "Notification",
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: NotificationListView(
            ProjectList: [items[0], items[2], items[0]],
          ),
        ),
      ),
    );
  }
}

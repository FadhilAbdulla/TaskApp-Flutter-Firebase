import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

final db = FirebaseFirestore.instance;

Future<Map<String, dynamic>> AuthenticateUser(
    {required String url, required Map RequestBody}) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _response = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(RequestBody));
  return jsonDecode(_response.body);
}

Future<Map<String, dynamic>> createNewUser({
  required String userEmail,
  required String userPassword,
}) async {
  try {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: userEmail,
      password: userPassword,
    );
    return {
      "status": "200",
      "message": "User created successfully",
      "userId": userCredential.user?.uid,
    };
  } on FirebaseAuthException catch (e) {
    return {
      "status": "400",
      "message": e.message,
    };
  } catch (e) {
    return {
      "status": "500",
      "message": "An unknown error occurred",
    };
  }
}

Future<Map<String, dynamic>> signInUser({
  required String userEmail,
  required String userPassword,
}) async {
  try {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: userEmail,
      password: userPassword,
    );
    return {
      "status": "200",
      "message": "User signed in successfully",
      "userId": userCredential.user?.uid,
    };
  } on FirebaseAuthException catch (e) {
    return {
      "status": "400",
      "message": e.message,
    };
  } catch (e) {
    return {
      "status": "500",
      "message": "An unknown error occurred",
    };
  }
}

Future<Map<String, dynamic>> getAllTasks() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("Tasks").get();

    List<Map<String, dynamic>> pastTasks = [];
    List<Map<String, dynamic>> todayTasks = [];

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> task = {
        "id": doc.id,
        ...doc.data() as Map<String, dynamic>,
      };

      if (task["Status"] == "Completed") {
        pastTasks.add(task);
      } else {
        todayTasks.add(task);
      }
    }

    return {
      "status": "200",
      "pastTasks": pastTasks,
      "todayTasks": todayTasks,
    };
  } catch (e) {
    print("Error getting tasks: $e");
    return {
      "status": "500",
      "pastTasks": [],
      "todayTasks": [],
    };
  }
}

void EditTaskDetails() {
  //function to edit task details
}

Future<Map<String, dynamic>> DeleteTaskDetails({required String taskId}) async {
  try {
    await FirebaseFirestore.instance.collection("Tasks").doc(taskId).delete();
    return {
      "status": "200",
      "message": "Task deleted successfully",
    };
  } catch (e) {
    print("Error deleting task: $e");
    return {
      "status": "500",
      "message": "Failed to delete task",
    };
  }
}

// Function to update dynamic items in an existing task in Firestore
Future<Map<String, dynamic>> updateTask({
  required String taskId,
  required String Category,
  required String TaskName,
  required String TaskPoints,
  required String TaskHours,
  required String Description,
  required DateTime TaskDate,
}) async {
  var request = FormatData(
      Category: Category,
      TaskName: TaskName,
      TaskPoints: TaskPoints,
      TaskHours: TaskHours,
      Description: Description,
      TaskDate: TaskDate);
  try {
    await FirebaseFirestore.instance
        .collection("Tasks")
        .doc(taskId)
        .update(request);
    return {
      "status": "200",
      "message": "Task updated successfully",
      "taskId": taskId,
    };
  } catch (e) {
    return {
      "status": "500",
      "message": e.toString(),
    };
  }
}

Future<Map<String, dynamic>> addNewTask({
  required String Category,
  required String TaskName,
  required String TaskPoints,
  required String TaskHours,
  required String Description,
  required DateTime TaskDate,
  // required String StartDate,
}) async {
  var request = FormatData(
      Category: Category,
      TaskName: TaskName,
      TaskPoints: TaskPoints,
      TaskHours: TaskHours,
      Description: Description,
      TaskDate: TaskDate);
  try {
    DocumentReference documentReference =
        await FirebaseFirestore.instance.collection("Tasks").add(request);
    return {
      "status": "200",
      "message": "Task added successfully",
      "taskId": documentReference.id,
    };
  } catch (e) {
    return {
      "status": "500",
      "message": e.toString(),
    };
  }
}

Map<String, dynamic> FormatData({
  required String Category,
  required String TaskName,
  required String TaskPoints,
  required String TaskHours,
  required String Description,
  required DateTime TaskDate,
}) {
  final data = {
    "Category": Category,
    "Name": TaskName,
    "Description": Description,
    "CompletedDate": "Apr 20-2024 , 10:00 am",
    "Points": TaskPoints,
    "Date": "${formatDate(TaskDate)} 9:00 am", //Today 09:00
    "Status": "ToDo",
    "PrimeDescription":
        "Design Task management App Design Task management AppDesign Task management AppDesign Task management AppDesign Task management AppDesign Task management",
    "StartDate": '${_formatStartDate(TaskDate)}',
    "StartTime": "9:00 am",
    "Hours": TaskHours,
    "Approved": "Ali"
  };

  return data;
}

String _formatStartDate(DateTime date) {
  return "${date.day}${_getMonthAbbreviation(date.month)}${date.year}";
}

String formatDate(DateTime date) {
  DateTime now = DateTime.now();
  DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
  DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);

  if (date.year == now.year && date.month == now.month && date.day == now.day) {
    return 'Today';
  } else if (date.year == yesterday.year &&
      date.month == yesterday.month &&
      date.day == yesterday.day) {
    return 'Yesterday';
  } else if (date.year == tomorrow.year &&
      date.month == tomorrow.month &&
      date.day == tomorrow.day) {
    return 'Tomorrow';
  } else {
    return '${_getMonthAbbreviation(date.month)} ${date.day}-${date.year}';
  }
}

String _getMonthAbbreviation(int month) {
  switch (month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return '';
  }
}

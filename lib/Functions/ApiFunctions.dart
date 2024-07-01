import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

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

void getTaskDetails() {
  //function to get details of a specific task

  // CollectionReference collectionRef = firestore.collection('Tasks');

  //     QuerySnapshot querySnapshot = await collectionRef.get();

  //     for (QueryDocumentSnapshot doc in querySnapshot.docs) {
  //       print(doc.data());
  //     }
  //   } catch (e) {
  //     print('Error fetching collection: $e');
  //   }
}

void EditTaskDetails() {
  //function to edit task details
}

void DeleteTaskDetails() {
  //function to delete a task
}

void AddNewtask() async {
  // await db.collection("Tasks").add(user).then((DocumentReference doc) =>
  //         print('DocumentSnapshot added with ID: ${doc.id}'));
  //   } catch (e) {
  //     print(e);
  //   }
}

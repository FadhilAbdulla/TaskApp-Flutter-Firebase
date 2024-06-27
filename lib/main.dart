import 'package:flutter/material.dart';
import 'Pages/BottomNavigation.dart';
import 'Pages/TaskManager.dart';
import 'Pages/SignIn.dart';
import 'Pages/NotificationPage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVP Application',
      theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
                color: Colors
                    .black), // Optional: to set the icon color in the AppBar to black
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          ), // Optional: to set the title color in the AppBar to
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
          fontFamily: "Montserrat"),
      initialRoute: '/signin',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const BottomNavigation(),
        '/signin': (BuildContext context) => const SignIn(),
        '/managetask': (BuildContext context) => const TaskManager(),
        '/notification': (BuildContext context) => const NotificationPage(),
      },
    );
  }
}

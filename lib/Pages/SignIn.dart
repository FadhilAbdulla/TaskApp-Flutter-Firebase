import 'package:flutter/material.dart';
import '../Components/TextAreaSimple.dart';
import '../Components/NormalButton.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Welcome back',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Please Enter your email and password to login',
              ),
              TextAreaSimple(placeholder: 'Email address'),
              TextAreaSimple(placeholder: 'Password'),
              Normalbutton(textinside: 'Login'),
            ],
          ),
        ),
      ),
    );
  }
}

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

  void Login() {
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                  height: 87,
                  width: 172,
                  margin: EdgeInsets.only(bottom: 150),
                  child: Image.asset('assets/Images/image.png')),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome back',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  const Text(
                    'Please Enter your email and password to login',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  TextAreaSimple(placeholder: 'Email address'),
                  TextAreaSimple(placeholder: 'Password'),
                  Normalbutton(textinside: 'Login', ButtonPressed: Login),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

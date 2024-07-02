import 'package:flutter/material.dart';
import '../Components/TextAreaSimple.dart';
import '../Components/NormalButton.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Functions/ApiFunctions.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final UserNameController = TextEditingController();
  final UserPasswordController = TextEditingController();
  bool isLoading = false;

  void Login() async {
    setState(() {
      isLoading = true;
    });
    final data = await signInUser(
        userEmail: UserNameController.text,
        userPassword: UserPasswordController.text);
    if (data["status"] == "200") {
      Navigator.of(context).pushReplacementNamed('/');
      SnackBar(content: Text('Welcome back'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Credentials are Wrong')),
      );
    }
    setState(() {
      isLoading = false;
    });
    // Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
              backgroundColor: const Color.fromARGB(255, 126, 126, 126),
              color: Color.fromARGB(194, 227, 227, 227),
            ))
          : Container(
              margin: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(
                        height: 87,
                        width: 172,
                        margin: EdgeInsets.only(bottom: 120),
                        child: Image.asset('assets/Images/image.png')),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                        ),
                        Text(
                          'Please Enter your email and password to login',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                        TextAreaSimple(
                          placeholder: 'Email address',
                          textController: UserNameController,
                        ),
                        TextAreaSimple(
                          placeholder: 'Password',
                          textController: UserPasswordController,
                        ),
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

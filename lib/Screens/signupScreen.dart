import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app_flutter/Screens/homeScreen.dart';
import 'package:note_app_flutter/Screens/color.dart';
import 'package:note_app_flutter/Screens/reusable_widget.dart';

class SignupScreen extends StatefulWidget {
   SignupScreen({Key? key}) : super(key: key);

  @override //1
  State<SignupScreen> createState() => _SignupScreenState();
  // final TextEditingController _passwordTextController = TextEditingController();
  // final TextEditingController _emailTextController = TextEditingController();
  // final TextEditingController _userNameTextController = TextEditingController();
}

class _SignupScreenState extends State<SignupScreen> { //2
  late TextEditingController textFieldController;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();



  Widget build(BuildContext context) {  //5
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: const Text(
              "Sign Up",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 170, 20, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    reusableTextField("Enter UserName", Icons.person_outline, false,
                        _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Email Id", Icons.person_outline, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outlined, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    firebaseUIButton(context, "Sign Up", () {

                      // FirebaseAuth.instance
                      //     .createUserWithEmailAndPassword(
                      //     email: _emailTextController.text,
                      //     password: _passwordTextController.text)
                      //     .then((value) {
                      //   print("Created New Account");
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (context) => HomeScreen()));
                      // }).onError((error, stackTrace) {
                      //   print("Error ${error.toString()}");
                      // });
                    })

                  ],
                ),
              ))),
    );
  }
}
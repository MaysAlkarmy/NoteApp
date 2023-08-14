import 'package:flutter/material.dart';
import 'package:note_app_flutter/Screens/Splash_Screen.dart';
import 'package:note_app_flutter/Screens/login_screen.dart';

import 'package:note_app_flutter/Screens/signupScreen.dart';
// import 'package:note_app_flutter/text/login2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

 class _MyHomePageState extends State<MyHomePage> {


   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(

           backgroundColor: Theme
               .of(context)
               .colorScheme
               .inversePrimary,

           title: Text(""),
         ),
         body: Column(

         )
     );
   }

}

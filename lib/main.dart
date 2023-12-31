import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_app_flutter/Screens/ResetPassword.dart';
import 'package:note_app_flutter/Screens/Splash_Screen.dart';
import 'package:note_app_flutter/Screens/homeScreen.dart';
import 'package:note_app_flutter/Screens/login_screen.dart';

import 'package:note_app_flutter/Screens/signupScreen.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: homeScreen(),
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

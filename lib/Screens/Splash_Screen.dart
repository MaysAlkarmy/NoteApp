import 'package:flutter/material.dart';
import 'package:note_app_flutter/Screens/login_screen.dart';
import 'package:note_app_flutter/Screens/color.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return login();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         decoration: BoxDecoration(
             gradient: LinearGradient(colors: [
               hexStringToColor("CB2B93"),
               hexStringToColor("9546C4"),
               hexStringToColor("5E61F4")
             ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),

         child: 
             Center(
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 30),
                 child: Container(
                   width: 150,
                   height: 150,
                   decoration: BoxDecoration(
                    image:   DecorationImage(
                      image: AssetImage('assets/images/note2.png',),


                       )
                   )
                   ,

                 ),
               ),
             )
         
        

       ),







    );
  }
}
    //     body: Container(
    //   width: double.infinity,
    //   height: double.infinity,
    //   decoration: BoxDecoration(
    //       image: DecorationImage(
    //     image: AssetImage('assets/images/Splash.png'),
    //     fit: BoxFit.fill,
    //   )),
    //   child: Container(
    //
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 130),
    //       child:
    //       Center(
    //         child: Image.asset(
    //           'assets/images/note2.png',
    //           width: 200,
    //           height: 200,
    //         ),
    //       ),
    //     ),
    //   ),
    // )
        // child: Image.asset('assets/images/noteSplash.gif'),


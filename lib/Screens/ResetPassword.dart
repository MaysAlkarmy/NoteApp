import 'package:flutter/material.dart';
import 'package:note_app_flutter/Screens/color.dart';
import 'package:note_app_flutter/Screens/reusable_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}
TextEditingController _emailTextController = TextEditingController();

class _ResetPasswordState extends State<ResetPassword> {
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
       child: Padding(
         padding: EdgeInsets.fromLTRB(
           20, MediaQuery.of(context).size.height * 0.2, 20, 0),
         child: Column(
           children: [
             Text('Reset Password', style: (TextStyle(fontSize: 30)),),
             SizedBox(
               height: 50,
             ),
             reusableTextField("Enter Email Id", Icons.person_outline, false,
                 _emailTextController),
             const SizedBox(
               height: 20,
             ),
             firebaseUIButton(context, "Reset Password", (){

             }

             )
           ],
         ),
       ),

     )


    );
  }
}

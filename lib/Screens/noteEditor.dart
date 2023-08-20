import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app_flutter/style/appStyle.dart';

class NoteEditor extends StatefulWidget {
  const NoteEditor({Key? key}) : super(key: key);

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  int color_id= Random().nextInt(AppStyle.cardsColor.length);
  String date= DateTime.now().toString();
  TextEditingController titleController= TextEditingController();
  TextEditingController mainController= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor:AppStyle.cardsColor[color_id] ,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Add new note', style: (TextStyle(color: Colors.black)),),
       ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'note title'
              ),

            ),
            SizedBox(height: 8,),
            Text(date),
            SizedBox(height: 28,),

            TextField(
              controller: mainController,
              keyboardType: TextInputType.multiline,
              minLines: null,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'note content'
              ),

            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.accentColor,
        onPressed: ()async{

          FirebaseFirestore.instance.collection("noteApp").add({
            "note_title": titleController.text,
            "creation_data": date,
            "note_content": mainController.text,
            "color_id": color_id,
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError((error) => print("failed to add new note due to $error"));
        },
        child: Icon(Icons.save),
      ),




    );
  }
}

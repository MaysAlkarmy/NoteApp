import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app_flutter/style/appStyle.dart';

class NoteReader extends StatefulWidget {
  NoteReader(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<NoteReader> createState() => _NoteReaderState();
}

class _NoteReaderState extends State<NoteReader> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.doc["note_title"],
            style: TextStyle(color: Colors.pink, fontSize: 20),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            widget.doc["creation_data"],
            style: TextStyle(color: Colors.pink, fontSize: 20),
          ),
          SizedBox(
            height: 28,
          ),
          Text(
            widget.doc["note_content"],
            style: TextStyle(color: Colors.pink, fontSize: 20),
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            child:
            ElevatedButton.icon(onPressed: (){

              FirebaseFirestore.instance.collection("noteApp").doc("doc").delete()
                  .then((doc) {
                 print("deleted");
                Navigator.pop(context);
              }).catchError((error) => print("failed to add new note due to $error"));
            }
                , icon: Icon(Icons.delete), label: Text('delete'),),
          )
        ],

        ),
      ),
    );
  }
}
void deleteNote(){
   
}

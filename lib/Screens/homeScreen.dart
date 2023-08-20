import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app_flutter/Screens/noteEditor.dart';
import 'package:note_app_flutter/Screens/noteReader.dart';
import 'package:note_app_flutter/style/appStyle.dart';
import 'package:note_app_flutter/widget/noteCard.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCB2B93),
      appBar: AppBar(
        elevation: 0.0,
        title: Text('FireNotes'),
        centerTitle: true,
        backgroundColor: Color(0xffCB2B93),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xffCB2B93),
              Color(0xff9546C4),
            ],
            begin: Alignment.center,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'your recent Notes',
                style: (TextStyle(color: Colors.white, fontSize: 22)),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("noteApp")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        children: snapshot.data!.docs
                            .map((note) => noteCard(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NoteReader(note),
                                      ));
                                }, note))
                            .toList(),
                      );
                    }
                    return Text(
                      'there is no note',
                      style: TextStyle(color: Colors.pink),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NoteEditor()));
        },
        label: Text('Add note'),
        icon: Icon(Icons.add),
      ),
    );
  }
}

void deleteNote(int index) {}

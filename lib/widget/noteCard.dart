import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_app_flutter/style/appStyle.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc){

  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[
          doc['color_id']
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
            style: TextStyle(color: Colors.pink,fontSize: 20),),
          SizedBox(height: 4,),
          Text(doc["creation_data"],style: TextStyle(color: Colors.pink, fontSize: 20),  ),
          SizedBox(height: 4,),
          Text(doc["note_content"],style: TextStyle(color: Colors.pink,fontSize: 20), overflow: TextOverflow.ellipsis, ),


        ],
      ),
    ),
  );

}
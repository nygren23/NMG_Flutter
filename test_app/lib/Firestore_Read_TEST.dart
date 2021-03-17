import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Readtest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      body: StreamBuilder(
        stream: Firestore.instance.collection('a').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data.documents.map((document) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Text("Name: " + document['name']),
                  ),
                );
            }).toList(),
          );
        }
      ),
    );

  }


}
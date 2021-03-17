import 'dart:ui';

import 'package:flutter/material.dart';

import './Home.dart';
import './Brandrelation.dart';
import './Professional.dart';
import './Quickjobs.dart';
import 'Firestore_Read_TEST.dart';



void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _index = 0;
  final _pages = [
    //Readtest(),
    Home(),
    Brandrelation(),
    Professional(),
    Quickjobs(),
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        accentColor: Colors.black,
        //fontFamily:
      ),
      debugShowCheckedModeBanner: false,
      title: "NMG App",
      home: new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[

            IconButton(
              icon: Image(
                image: AssetImage('assets/icon.png'),
              ),
              onPressed: (){},
            ),
          ],
          title:
                Text(
                  'Campus Collaborative'
                ),

        ),
        body: _pages[_index],
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,

          ),
          child: new BottomNavigationBar(
          fixedColor: Colors.blue,
          iconSize: 30,
          currentIndex: _index,
          onTap: (int index) {
            setState((){
              _index = index;
            });
          },

          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: new Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.people),
                title: Text('Brand Relations')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.work),
                title: Text('Professional')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.timer),
                title: Text('Quick Jobs')
            ),


          ],
        ),
        ),

      ),
    );
  }
}


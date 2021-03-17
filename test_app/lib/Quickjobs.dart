import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import './Upload.dart';
import 'Surveypage.dart';
import 'utils/constants.dart';

class Quickjobs extends StatelessWidget {
  final String folder = '/quick_proof';


  @override
  Widget build(BuildContext context) {

    Future goToUploadPage(context) async {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Upload(folder)));
    }

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          body: new CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 300,
            backgroundColor: Colors.grey,
            snap: false,
            //bottom:
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              title: new Padding(
                padding: EdgeInsets.only(
                  top: 29.0,
                  left: 10.0,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                  "Quick Jobs",
                  style: TextStyle(
                    fontSize: 27.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ),
              ),
              background: new Opacity(
                opacity: 0.7,
                child: Image(
                  image: AssetImage("assets/brewdr1.jpg"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.only(
                    top: 7.0,
                  ),
                  child: Divider(
                    thickness: 2.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            'If you have already completed a task, upload proof here'),
                      ),
                      SizedBox(
                        width: 150.0,
                        height: 50.0,
                        child: RaisedButton(
                          elevation: 8.0,
                          child: Center(
                            child: Text('Upload your work'),
                          ),
                          onPressed: () {
                            goToUploadPage(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: new Padding(
              padding: EdgeInsets.all(7.0),
              child: Divider(
                thickness: 2.0,
              ),
            ),
          ),
          SliverAppBar(
            title: new Text(
              "Surveys to Take",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            pinned: true,
            backgroundColor: Colors.black,
            //expandedHeight: 100.0,
          ),

          SliverToBoxAdapter(
              child: StreamBuilder(
                stream: Firestore.instance.collection('Surveys to Take (P)').snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Column(
                    children: <Widget>[

                      Column(
                        children: snapshot.data.documents.map((document) {
                          //checks each program to see if active using built in switch in firestore
                          if (document['active']) {
                            return Column(children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              FittedBox(
                                child: Material(
                                  elevation: 0.0,
                                  borderRadius: new BorderRadius.circular(8.0),
                                  color: Colors.grey,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width * .9,
                                        height: CARD_HEIGHT,
                                        //MediaQuery.of(context).size.height * 0.25,
                                        child:
                                        new ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: new Radius.circular(8.0),
                                              topRight: new Radius.circular(8.0),
                                            ),
                                            child: Image(
                                                fit: BoxFit.fill,
                                                alignment: Alignment.topRight,
                                                image:
                                                AssetImage(document['image']))),
                                      ),
                                      Container(
                                        child: Text(document['name'],
                                            style: TextStyle(color: Colors.white,
                                              fontSize: FONT_SIZE,)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ]);
                          }

                          return Container(
                            height: 0,
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              )),

          SliverToBoxAdapter(
            child: new Padding(
              padding: EdgeInsets.all(7.0),
              child: Divider(
                thickness: 2.0,
              ),
            ),
          ),
          SliverAppBar(
            title: new Text(
              "Surveys to Send",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            pinned: true,
            backgroundColor: Colors.black,
          ),
          SliverToBoxAdapter(
              child: StreamBuilder(
                stream: Firestore.instance.collection('Surveys to Send (P)').snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Column(
                    children: <Widget>[

                      Column(
                        children: snapshot.data.documents.map((document) {
                          //checks each program to see if active using built in switch in firestore
                          if (document['active']) {
                            return Column(children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              FittedBox(
                                child: Material(
                                  elevation: 0.0,
                                  borderRadius: new BorderRadius.circular(8.0),
                                  color: Colors.grey,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width * .9,
                                        height: CARD_HEIGHT,
                                        //MediaQuery.of(context).size.height * 0.25,
                                        child:
                                        new ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: new Radius.circular(8.0),
                                              topRight: new Radius.circular(8.0),
                                            ),
                                            child: Image(
                                                fit: BoxFit.fitWidth,
                                                alignment: Alignment.topRight,
                                                image:
                                                AssetImage(document['image']))),
                                      ),
                                      Container(
                                        child: Text(document['name'],
                                            style: TextStyle(color: Colors.white,
                                              fontSize: FONT_SIZE,)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ]);
                          }

                          return Container(
                            height: 0,
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              )),
        ],
      )),
    );
  }
}
/*
SliverList(
delegate: SliverChildListDelegate(
[
new Padding(
padding: EdgeInsets.all(12.0),
child: Container(
child: Column(
children: <Widget>[
RaisedButton(
child: Text('Survey'),
onPressed: () async {
Navigator.push(context, MaterialPageRoute(builder: (context) => Surveypage()));
},
),
],
),
)),
],
),
),

_launchBean() async {
  const url = 'https://www.llbean.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
*/
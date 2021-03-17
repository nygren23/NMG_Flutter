import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import './Upload.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'utils/constants.dart';

class Brandrelation extends StatelessWidget {
  final String folder = '/brand_proof';

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

            backgroundColor: Color(0xFFBDBDBD),
            snap: false,
            //bottom:
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              title: new Padding(
                padding: EdgeInsets.only(
                  top: 29.0,
                  left: 10.0,
                ),
                child: new Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Brand Relations",
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
                  image: AssetImage("assets/llbean6.jpg"),
                  fit: BoxFit.cover,
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
              "Brand Ambassador Programs",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            pinned: true,
            backgroundColor: Colors.black,
            //expandedHeight: 100.0,
          ),

          /*
          *information from reading data from Firestore from:
          *Bleyl Dev
          *on youtube
          */
          SliverToBoxAdapter(
              child: StreamBuilder(
                stream: Firestore.instance.collection('Student Ambassador (P)').snapshots(),
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
              "Sampling",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            pinned: true,
            backgroundColor: Colors.black,
          ),

          /*
          *information from reading data from Firestore from:
          *Bleyl Dev
          *on youtube
          */
          SliverToBoxAdapter(
              child: StreamBuilder(
            stream: Firestore.instance.collection('Sampling (P)').snapshots(),
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

_launchBean() async {
  const url = 'https://www.llbean.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

/*
new Column(
                                  children: <Widget>[
                                    Container(
                                      height: 110,
                                      width: 200,
                                      child: GestureDetector(
                                        onTap: _launchBean,
                                        child: new ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: new Radius.circular(8.0),
                                              topRight:
                                                  new Radius.circular(8.0),
                                            ),
                                            child: Image(
                                                fit: BoxFit.fill,
                                                alignment: Alignment.topRight,
                                                image: AssetImage(
                                                    "assets/llbeanlogo.jpg"))),
                                      ),
                                    ),
                                    Container(
                                        child: new Text(
                                      "L.L. Bean",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ],
                                )

*/

/*
child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Container(
                                    child: FittedBox(
                                        child: Material(
                                          elevation: 0.0,
                                          borderRadius: new BorderRadius.circular(8.0),
                                          color: Colors.grey,
                                          child: Text("" + document['name'])

                                          /*Image(

                                          image: AssetImage(
                                            "" + document['name']
                                          ),
                                          ),
                                          */

                                        )
                                    )
                                )
                            ),
 */

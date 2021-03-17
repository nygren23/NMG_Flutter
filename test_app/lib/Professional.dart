import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'utils/constants.dart';

class Professional extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  child: new Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                    "Professional",
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
                    image: AssetImage("assets/llbean1.jpg"),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topLeft,
                  ),
                ),
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
                "Recruitment",
              ),
              pinned: true,
              backgroundColor: Colors.black,
            ),

            SliverToBoxAdapter(
                child: StreamBuilder(
                  stream: Firestore.instance.collection('Recruitment (P)').snapshots(),
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
                "Job Opportunities",
              ),
              pinned: true,
              backgroundColor: Colors.black,
            ),
            SliverToBoxAdapter(
                child: StreamBuilder(
                  stream: Firestore.instance.collection('Job Opportunities (P)').snapshots(),
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
        )));
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

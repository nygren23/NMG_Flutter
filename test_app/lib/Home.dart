import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    precacheImage(AssetImage("assets/header2.jpg"), context);


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
          body: new CustomScrollView(
            physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 400,
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
                  child: new Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              background: Image(image: AssetImage("assets/header2.jpg",), fit: BoxFit.fill),
              /*
              new Carousel(
                  animationDuration: Duration(seconds: 2),
                  dotIncreaseSize: 1.0,
                  autoplayDuration: Duration(seconds: 3),
                    images: [
                  Image(
                    image: AssetImage("assets/header2.jpg"),
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.topLeft,
                  ),
                Image(
                  image: AssetImage("assets/header.jpg"),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topLeft,
                ),
                ]
                ),
              */

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

          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(8.0),
                child: Column (
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                      'About Newbridge Marketing Group',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'We’re a value-driven group of individuals from a variety of backgrounds and perspectives who work well together to bring creative and practical solutions to our brand partners.',
                    ),
                    Divider(
                      thickness: 2.0,
                    ),
                    SizedBox(
                     // height: 30.0
                    ),
                  ],



                )
                ),
              ]

            )
          ),

        ],
      )
      ),
    );
  }
}

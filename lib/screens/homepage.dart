import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'images/LxBuilding1.png',
  'images/LxBuilding2.png',
  'images/LxBuilding3.png',
  'images/LxBuilding4.png',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                  ],
                )),
          ),
        ))
    .toList();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("NavKMUTT")
      ),
      body: Container(
          child: ListView(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  aspectRatio: 2,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(13.0, 10.0, 13.0, 13.0),
                child: Text(
                  'Activities & News',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(13.0, 0, 13.0, 0),
                child: Card(
                  elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Text(
                        'LX Opening Exhibition Changed Present Date',
                      ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(13.0, 0, 13.0, 0),
                child: Card(
                  elevation: 2,
                  child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text(
                      'KMUTT Fight Covid-19 Campaign',
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(13.0, 0, 13.0, 0),
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text(
                      'Covid-19 Spread Around KMUTT',
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(13.0, 0, 13.0, 0),
                  child: Card(
                  elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Text(
                        'KMUTT Associated With Hospital',
                      ),
                    ),
                  ),
          ),
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';

class RoomDetail extends StatelessWidget {
  final String name;
  RoomDetail(this.name);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SafeArea(
        child: Container(
          height: 200.0,
          color: Colors.transparent,
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "Picture of " + name + " room",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
      )
    );
  }
}

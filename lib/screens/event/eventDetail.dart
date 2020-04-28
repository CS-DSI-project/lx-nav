import 'package:flutter/material.dart';
class EventDetail extends StatelessWidget {
  final String detailName;
  EventDetail(this.detailName);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(detailName),
        ),
        body: SafeArea(
            child: Container(

            )
        )
    );
  }
}


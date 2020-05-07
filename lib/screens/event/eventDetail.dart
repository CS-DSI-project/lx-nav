import 'package:flutter/material.dart';

class EventDetail extends StatelessWidget {
  final String roomName;
  final String eventName;
  final String detail;
  EventDetail(this.roomName, this.eventName, this.detail);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(roomName),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'images/LxEvent1.jpg',
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Text(
                  eventName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: Text(
                  'Time: 10.00-15.00',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Text(detail),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Image.asset('images/insideMap.jpg'),
              )
            ],
          ),
        )));
  }
}

import 'package:flutter/material.dart';
import 'package:lxnav/screens/room/roomDetail.dart';

class Room extends StatefulWidget {
  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: AppBar(
         title: Text('Room'),
       ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RoomDetail('LX101')),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Center(
                        child: Text(
                          'LX-101',
                          style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.w500),
                        ),
                      )
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RoomDetail('LX102')),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Center(
                          child: Text(
                            'LX-102',
                            style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.w500),
                          ),
                        )
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RoomDetail('LX103')),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Center(
                          child: Text(
                            'LX-103',
                            style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.w500),
                          ),
                        )
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RoomDetail('LX104')),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Center(
                          child: Text(
                            'LX-104',
                            style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.w500),
                          ),
                        )
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }
}

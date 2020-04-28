import 'package:flutter/material.dart';
import 'package:lxnav/screens/event/eventDetail.dart';
class Event extends StatelessWidget {
  final String name;
  Event(this.name);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: SafeArea(
          child: ListDetail()
        )
    );
  }
}
class ListDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<ListDetail> {
  List items = getDummyList();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
                margin: EdgeInsets.fromLTRB(10, 5, 5, 10),
                elevation: 5,
                child: Container(
                  height: 120,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 120.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                topLeft: Radius.circular(5)
                            ),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/LxRoom1.png")
                            )
                        ),
                      ),
                      Container(
                        height: 200,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                items[index],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                                child: Container(
                                  child: Text("Information Technology Innovation Show",textAlign: TextAlign.center, style: TextStyle(
                                    fontWeight: FontWeight.w500
                                  ),),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(
                                  child: Text("Time: 10.00 - 11.30",style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                  ),),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => EventDetail(items[index].toString() + ' event')));
                                  },
                                  child: const Text('Show more', style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w400
                                  ),),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
          }
        )
    );
  }

  static List getDummyList() {
    List list = List.generate(6, (i) {
      return "LX-10${i + 1}";
    });
    return list;
  }
}

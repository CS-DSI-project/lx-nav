import 'package:flutter/material.dart';
import 'package:lxnav/screens/event/eventDetail.dart';
import 'package:lxnav/models/graphql.dart';

class Event extends StatefulWidget {
  final String name;
  Event(this.name);
  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    if (widget.name.length > 22) {
      return new Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          if (!isSearching) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: !isSearching,
                flexibleSpace: FlexibleSpaceBar(
                  title: !isSearching
                      ? Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      : TextField(
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          decoration: InputDecoration(
                              icon: Icon(Icons.search, color: Colors.white),
                              hintText: "Search for room or event",
                              hintStyle:
                                  TextStyle(color: Colors.white)),
                        ),
                  titlePadding: EdgeInsets.only(left: 50, bottom: 20),
                ), 
                actions: <Widget>[
                  isSearching 
                  ? IconButton(
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                      });
                      print(isSearching);
                    },
                    icon: Icon(Icons.cancel),
                  )
                  :IconButton(
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                      print(isSearching);
                    },
                    icon: Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.sort),
                  ),
                ],
                expandedHeight: 100.0,
              ),
            ];
          } else {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: !isSearching,
                title: !isSearching
                    ? Text(widget.name)
                    : TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            icon: Icon(Icons.search, color: Colors.white,),
                            hintText: "Search for room or event",
                            hintStyle:TextStyle(color: Colors.white)),
                      ),
                actions: <Widget>[
                  isSearching 
                  ? IconButton(
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                      });
                      print(isSearching);
                    },
                    icon: Icon(Icons.cancel),
                  )
                  :IconButton(
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                      print(isSearching);
                    },
                    icon: Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.sort),
                  ),
                ],
              )
            ];
          }
        },
        body: ListDetail(),
      ));
    } else {
      return new Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: !isSearching,
              title: !isSearching
                    ? Text(widget.name)
                    : TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            icon: Icon(Icons.search, color: Colors.white,),
                            hintText: "Search for room or event",
                            hintStyle:TextStyle(color: Colors.white)),
                      ),
                actions: <Widget>[
                  isSearching 
                  ? IconButton(
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                      });
                      print(isSearching);
                    },
                    icon: Icon(Icons.cancel),
                  )
                  :IconButton(
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                      print(isSearching);
                    },
                    icon: Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.sort),
                  ),
                ],
            )
          ];
        },
        body: ListDetail(),
      ));
    }
  }
}

class ListDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<ListDetail> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: getInfo(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            List<EventData> dataEvent = snapshot.data;
            return Container(
                child: ListView.builder(
                    padding: EdgeInsets.all(0.0),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
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
                                          topLeft: Radius.circular(5)),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "images/LxRoom1.png"))),
                                ),
                                Container(
                                  height: 200,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          dataEvent[index].name,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 3, 0, 3),
                                          child: Container(
                                            child: Text(
                                              dataEvent[index].desc,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 5, 0, 2),
                                          child: Container(
                                            child: Text(
                                              "Time: 10.00 - 15.00",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 2, 0, 2),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                RaisedButton(
                                                  color: Colors.orange,
                                                  onPressed: () {
                                                    Navigator.of(
                                                            context)
                                                        .push(MaterialPageRoute(
                                                            builder: (context) =>
                                                                EventDetail(
                                                                    dataEvent[
                                                                            index]
                                                                        .name,
                                                                    dataEvent[
                                                                            index]
                                                                        .desc,
                                                                    dataEvent[
                                                                            index]
                                                                        .body)));
                                                  },
                                                  child: const Text(
                                                    'Show more',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ));
                    }));
          } else {
            return Container();
          }
        });
  }
}

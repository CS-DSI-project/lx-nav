import 'package:flutter/material.dart';
import 'package:lxnav/screens/event/eventDetail.dart';

class Event extends StatelessWidget {
  final String name;
  Event(this.name);

  @override
  Widget build(BuildContext context) {
    if (name.length > 22) {
      return new Scaffold(body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverMultilineAppBar(
              title: name,
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                ),
              ],
            ),
          ];
        },
        body: ListDetail(),
      ));
    } else {
      return new Scaffold(
        appBar: AppBar(
          title: Text(name),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: ListDetail(),
      );
    }
  }
}

class SliverMultilineAppBar extends StatelessWidget {
  final String title;
  final Widget leading;
  final List<Widget> actions;

  SliverMultilineAppBar({this.title, this.leading, this.actions});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    double availableWidth = mediaQuery.size.width - 160;
    if (actions != null) {
      availableWidth -= 36 * actions.length;
    }
    return SliverAppBar(
      expandedHeight: 120.0,
      forceElevated: true,
      leading: leading,
      actions: actions,
      flexibleSpace: FlexibleSpaceBar(
        title: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: availableWidth,
          ),
          child: Text(
            title,
            textScaleFactor: .8,
          ),
        ),
      ),
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
              return Container(
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
                                image: AssetImage("images/LxRoom1.png"))),
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
                                  child: Text(
                                    "Business Conference 2020",
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
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
                                  padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      RaisedButton(
                                        color: Colors.orange,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EventDetail(items[index]
                                                              .toString() +
                                                          ' Event')));
                                        },
                                        child: const Text(
                                          'Show more',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
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
                );
            }));
  }

  static List getDummyList() {
    List list = List.generate(6, (i) {
      return "LX-10${i + 1}";
    });
    return list;
  }
}

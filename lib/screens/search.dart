import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? Text("Event/Room")
            : TextField(
                style: TextStyle(color:  Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                        Icons.search,
                        color: Colors.white,
                    ),
                    hintText: "Search event or room",
                    hintStyle: TextStyle(color: Colors.white)
                ),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel, color: Colors.white,),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: Center(
        child: Text("Search"),
      ),
    );
  }
}

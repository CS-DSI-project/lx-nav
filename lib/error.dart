import 'package:flutter/material.dart';
class Error extends StatefulWidget {
  @override
  _ErrorState createState() => _ErrorState();
}
class _ErrorState extends State<Error> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 102, 0, 1.0),
        title: Text('Error'),
    ),
    body: Center(child: Text('ERROR 404 ')),);


}
}

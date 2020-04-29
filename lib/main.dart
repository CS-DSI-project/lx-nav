import 'package:flutter/material.dart';
import 'package:lxnav/screens/splashScreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';


import 'dart:async';

Future main() async {
  await DotEnv().load('.env');
  initializeDateFormatting().then((_) => runApp(new MaterialApp(
        home: new MyApp(),
      )));
}

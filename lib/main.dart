import 'package:flutter/material.dart';
import 'package:survey_covid19/pages/login.dart';
import 'package:survey_covid19/pages/result.dart';
import 'package:survey_covid19/pages/surver.dart';
import 'package:survey_covid19/pages/welcomeScreen.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStarted(),
      routes: {
        'survey': (context) => Survey(),
        'login': (context) => Login(),
        'hasil': (context) => Result(),
      },
    );
  }
}

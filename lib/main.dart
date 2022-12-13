import 'package:azkar/AzkaarDetails.dart';
import 'package:azkar/DataItem.dart';
import 'package:azkar/AzkarHomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>HomePage(),
      },
    );
  }
}


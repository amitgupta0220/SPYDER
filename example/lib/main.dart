import 'package:flutter/material.dart';
import 'package:spyder_example/Screens/InfoScreen.dart';
import 'package:spyder_example/Style/MyColors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Oxygen',
        accentColor: MyColors.boxBackground,
      ),
      debugShowCheckedModeBanner: false,
      home: InfoScreen(),
    );
  }
}

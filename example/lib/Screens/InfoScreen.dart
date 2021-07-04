import 'package:flutter/material.dart';
import 'package:spyder_example/Style/MediaQuery.dart';
import 'package:spyder_example/Style/MyColors.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  List colors = [];
  double varHeight = 80;
  @override
  Widget build(BuildContext context) {
    Size size = getSizeOfContext(context);
    return Scaffold(
      backgroundColor: MyColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.08,
            ),
            GestureDetector(
              onTap: () {
                if (varHeight == 80) {
                  setState(() {
                    varHeight = 200;
                  });
                } else {
                  setState(() {
                    varHeight = 80;
                  });
                }
              },
              child: AnimatedContainer(
                curve: Curves.easeIn,
                constraints: BoxConstraints(minHeight: 80),
                duration: Duration(milliseconds: 500),
                height: varHeight,
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.05),
                margin: EdgeInsets.all(size.width * 0.05),
                decoration: BoxDecoration(
                  color: MyColors.boxBackground,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "What is caesar cipher?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

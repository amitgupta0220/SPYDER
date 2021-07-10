import 'package:flutter/material.dart';
import 'package:spyder_example/ContentForInfoScreen/Content.dart';
import 'package:spyder_example/Screens/InfoBox.dart';
import 'package:spyder_example/Style/MediaQuery.dart';
import 'package:spyder_example/Style/MyColors.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  List colors = Content().colors;
  List questions = Content().questions;
  List contents = Content().contents;
  List maxHeight = Content().maxHeight;

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
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InfoBox(
                    selectedIndex: index,
                    color: colors[index % 5],
                    question: questions[index],
                    content: contents[index],
                    maxHeight: double.parse(maxHeight[index].toString()),
                  );
                })
          ],
        ),
      ),
    );
  }
}

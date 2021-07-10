import 'package:flutter/material.dart';
import 'package:spyder_example/Screens/DetailTab.dart';
import 'package:spyder_example/Style/MediaQuery.dart';
import 'package:spyder_example/Style/MyColors.dart';

class InfoBox extends StatefulWidget {
  final Color color;
  final int selectedIndex;
  final String question, content;
  final double maxHeight;
  InfoBox({
    this.selectedIndex,
    this.color,
    this.question,
    this.content,
    this.maxHeight,
  });
  @override
  _InfoBoxState createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  double varHeight = 80;

  @override
  Widget build(BuildContext context) {
    Size size = getSizeOfContext(context);
    return GestureDetector(
      onTap: () {
        if (varHeight == 80) {
          setState(() {
            varHeight = widget.maxHeight;
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.question,
                style: TextStyle(color: widget.color),
              ),
              SizedBox(
                height: 5,
              ),
              varHeight == widget.maxHeight
                  ? Text(
                      widget.content,
                      style: TextStyle(
                        color: MyColors.white,
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 5,
              ),
              varHeight == widget.maxHeight
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailTab(
                            selectedTab: widget.selectedIndex,
                            cipherName: widget.question
                                .substring(8, widget.question.length - 1),
                            color: widget.color,
                          ),
                        ));
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: widget.color),
                                color: MyColors.boxBackground,
                                borderRadius: BorderRadius.circular(4)),
                            alignment: Alignment.center,
                            height: 20,
                            width: 50,
                            child: Text(
                              "Start",
                              style: TextStyle(color: widget.color),
                            )),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

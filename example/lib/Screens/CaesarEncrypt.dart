import 'package:flutter/material.dart';
import 'package:spyder_example/Style/MediaQuery.dart';
import 'package:spyder_example/Style/MyColors.dart';

class CaesarEncrypt extends StatefulWidget {
  final Color color;
  CaesarEncrypt({this.color});
  @override
  _CaesarEncryptState createState() => _CaesarEncryptState();
}

class _CaesarEncryptState extends State<CaesarEncrypt> {
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    Size size = getSizeOfContext(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: MyColors.background,
      body: Column(
        children: [
          Text(
            "Caesar Cipher",
            style: TextStyle(color: widget.color, fontSize: 20),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            padding: EdgeInsets.only(left: size.width * 0.08),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = 0;
                    });
                  },
                  child: Text(
                    "Encrypt",
                    style: TextStyle(
                        color: currentTab == 0 ? widget.color : MyColors.white,
                        fontSize: currentTab == 0 ? 17 : 15),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentTab = 1;
                    });
                  },
                  child: Text(
                    "Decrypt",
                    style: TextStyle(
                        color: currentTab == 1 ? widget.color : MyColors.white,
                        fontSize: currentTab == 0 ? 15 : 17),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Expanded(
            child: Container(
              child: Text("sbfs"),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                color: MyColors.boxBackground,
              ),
              width: size.height,
            ),
          ),
          // Stack(
          //   children: [
          //     Container(
          //       height: MediaQuery.of(context).size.height -82.0,
          //       width: MediaQuery.of(context).size.height,
          //       color: Colors.transparent,
          //     ),
          //     Positioned(
          //       top: 75,
          //       child: Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(45),
          //             topRight: Radius.circular(45),
          //           ),
          //           color: MyColors.boxBackground,
          //         ),
          //         height: MediaQuery.of(context).size.height -100,
          //       width: MediaQuery.of(context).size.height,
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}

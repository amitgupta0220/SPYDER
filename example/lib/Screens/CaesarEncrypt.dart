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
  final _plainTextController = TextEditingController();
  final _cipherTextController = TextEditingController();
  String dropDownShift = '0';
  List<String> numbers = new List<String>.generate(26, (i) => '$i');
  @override
  Widget build(BuildContext context) {
    Size size = getSizeOfContext(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                color: MyColors.boxBackground,
              ),
              width: size.height,
              child: currentTab == 0
                  ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: size.height * 0.08),
                          padding: EdgeInsets.all(14),
                          child: TextField(
                              controller: _plainTextController,
                              decoration: InputDecoration(
                                  filled: true,
                                  hoverColor: Colors.transparent,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: MyColors.white),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: MyColors.white),
                                  ),
                                  hintStyle: TextStyle(
                                      fontSize: 12, color: Color(0xffB3B3B3)),
                                  // hintText: 'abc@def.com',
                                  hintText: "Enter a Plain Text")),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              Text(
                                "Shift :",
                                style: TextStyle(
                                    color: MyColors.white, fontSize: 20),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 25),
                                margin:
                                    EdgeInsets.only(left: size.width * 0.01),
                                child: DropdownButton<String>(
                                  style: TextStyle(color: Color(0xff9D9D9D)),
                                  value: dropDownShift,
                                  // style: TextStyle(color: Colors.deepPurple),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropDownShift = newValue;
                                    });
                                  },
                                  items: numbers.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          width: size.width * 0.3,
                          height: 45,
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: widget.color),
                          child: Center(
                              child: Text(
                            "Encrypt",
                            style: TextStyle(
                                color: MyColors.background,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(14),
                          child: Text(
                            "Cipher Generated :",
                            style:
                                TextStyle(color: MyColors.white, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          padding: EdgeInsets.all(14),
                          child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  filled: true,
                                  hoverColor: Colors.transparent,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: MyColors.white),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: MyColors.white),
                                  ),
                                  hintStyle: TextStyle(
                                      fontSize: 12, color: Color(0xffB3B3B3)),
                                  // hintText: 'abc@def.com',
                                  hintText: "")),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: size.height * 0.08),
                          padding: EdgeInsets.all(14),
                          child: TextField(
                              controller: _cipherTextController,
                              decoration: InputDecoration(
                                  filled: true,
                                  hoverColor: Colors.transparent,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: MyColors.white),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: MyColors.white),
                                  ),
                                  hintStyle: TextStyle(
                                      fontSize: 12, color: Color(0xffB3B3B3)),
                                  // hintText: 'abc@def.com',
                                  hintText: "Enter a Cipher Text")),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              Text(
                                "Shift :",
                                style: TextStyle(
                                    color: MyColors.white, fontSize: 20),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 25),
                                margin:
                                    EdgeInsets.only(left: size.width * 0.01),
                                child: DropdownButton<String>(
                                  style: TextStyle(color: Color(0xff9D9D9D)),
                                  value: dropDownShift,
                                  // style: TextStyle(color: Colors.deepPurple),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropDownShift = newValue;
                                    });
                                  },
                                  items: numbers.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          width: size.width * 0.3,
                          height: 45,
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: widget.color),
                          child: Center(
                              child: Text(
                            "Decrypt",
                            style: TextStyle(
                                color: MyColors.background,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(14),
                          child: Text(
                            "Plain text Generated :",
                            style:
                                TextStyle(color: MyColors.white, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Container(
                          padding: EdgeInsets.all(14),
                          child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  filled: true,
                                  hoverColor: Colors.transparent,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: MyColors.white),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: MyColors.white),
                                  ),
                                  hintStyle: TextStyle(
                                      fontSize: 12, color: Color(0xffB3B3B3)),
                                  // hintText: 'abc@def.com',
                                  hintText: "")),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

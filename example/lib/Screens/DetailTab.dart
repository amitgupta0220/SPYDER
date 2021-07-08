import 'package:flutter/material.dart';
import 'package:spyder/spyder.dart';
import 'package:spyder_example/Style/MediaQuery.dart';
import 'package:spyder_example/Style/MyColors.dart';
import 'package:spyder_example/Validation/Validation.dart';

class DetailTab extends StatefulWidget {
  final Color color;
  final int selectedTab;
  final String cipherName;
  DetailTab({this.color, this.selectedTab, this.cipherName});
  @override
  _DetailTabState createState() => _DetailTabState();
}

class _DetailTabState extends State<DetailTab> {
  int currentTab = 0;
  TextEditingController _plainTextController = TextEditingController();
  TextEditingController _keywordTextController = TextEditingController();
  TextEditingController _decryptedTextController = TextEditingController();
  TextEditingController _cipherTextController = TextEditingController();
  String dropDownShift = '0', nameOfText;
  List<String> numbers = new List<String>.generate(26, (i) => '$i');
  @override
  void initState() {
    super.initState();
    nameOfText = widget.cipherName;
  }

  @override
  Widget build(BuildContext context) {
    Size size = getSizeOfContext(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: MyColors.background,
        body: Column(
          children: [
            Text(
              widget.cipherName,
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
                          color:
                              currentTab == 0 ? widget.color : MyColors.white,
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
                          color:
                              currentTab == 1 ? widget.color : MyColors.white,
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
                                    hintText: currentTab == 0
                                        ? "Enter a Plain Text"
                                        : "Enter a cipher Text")),
                          ),
                          widget.selectedTab == 0
                              ? Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Shift :",
                                        style: TextStyle(
                                            color: MyColors.white,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 25),
                                        margin: EdgeInsets.only(
                                            left: size.width * 0.01),
                                        child: DropdownButton<String>(
                                          style: TextStyle(
                                              color: Color(0xff9D9D9D)),
                                          value: dropDownShift,
                                          // style: TextStyle(color: Colors.deepPurple),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropDownShift = newValue;
                                            });
                                          },
                                          items: numbers
                                              .map<DropdownMenuItem<String>>(
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
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Keyword :",
                                        style: TextStyle(
                                            color: MyColors.white,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Container(
                                          width: size.width * 0.55,
                                          margin: EdgeInsets.only(
                                              left: size.width * 0.01),
                                          child: TextField(
                                              controller:
                                                  _keywordTextController,
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: MyColors.white),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: MyColors.white),
                                                  ),
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xffB3B3B3)),
                                                  // hintText: 'abc@def.com',
                                                  hintText:
                                                      "Enter a keyword"))),
                                    ],
                                  ),
                                ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          GestureDetector(
                            onTap: () async {
                              switch (widget.selectedTab) {
                                case 0:
                                  if (_plainTextController.text
                                      .trim()
                                      .isNotEmpty) {
                                    await Spyder.encryptUsingCaesarCipher(
                                            _plainTextController.text.trim(),
                                            dropDownShift)
                                        .then((value) {
                                      setState(() {
                                        _decryptedTextController.text = value;
                                      });
                                      return null;
                                    });
                                  }

                                  break;
                                case 1:
                                  if (_plainTextController.text
                                      .trim()
                                      .isNotEmpty) {
                                    if (Validation().validationForHillCipher(
                                            _keywordTextController.text) ==
                                        "true") {
                                      List<String> listOfArg;
                                      List<int> t;
                                      for (int i = 0;
                                          i < listOfArg.length;
                                          i++) {
                                        t.add(
                                            double.parse(listOfArg[i]).toInt());
                                      }
                                      await Spyder.encryptUsingHillCipher(
                                              _plainTextController.text.trim(),
                                              t)
                                          .then((value) {
                                        setState(() {
                                          _decryptedTextController.text = value;
                                        });
                                        return null;
                                      });
                                    } else {
                                      //error
                                    }
                                  }

                                  break;
                                case 2:
                                  if (_plainTextController.text
                                      .trim()
                                      .isNotEmpty) {
                                    await Spyder.encryptUsingRailFenceCipher(
                                            _plainTextController.text.trim(),
                                            double.parse(_keywordTextController
                                                    .text
                                                    .trim())
                                                .toInt())
                                        .then((value) {
                                      setState(() {
                                        _decryptedTextController.text = value;
                                      });
                                      return null;
                                    });
                                  }

                                  break;
                                case 3:
                                  if (_plainTextController.text
                                      .trim()
                                      .isNotEmpty) {
                                    if (Validation().validationForVignere(
                                            _cipherTextController.text
                                                .trim()) ==
                                        "true") {
                                      await Spyder.encryptUsingVignereCipher(
                                              _plainTextController.text.trim(),
                                              _keywordTextController.text
                                                  .trim())
                                          .then((value) {
                                        setState(() {
                                          _decryptedTextController.text = value;
                                        });
                                        return null;
                                      });
                                    } else {
                                      //error
                                    }
                                  }

                                  break;
                                case 4:
                                  if (_plainTextController.text
                                      .trim()
                                      .isNotEmpty) {
                                    if (Validation().validationForPlayFair(
                                            _cipherTextController.text
                                                .trim()) ==
                                        "true") {
                                      await Spyder.encryptUsingPlayFairCipher(
                                              _plainTextController.text.trim(),
                                              _keywordTextController.text
                                                  .trim())
                                          .then((value) {
                                        setState(() {
                                          _decryptedTextController.text = value;
                                        });
                                        return null;
                                      });
                                    } else {
                                      //error
                                    }
                                  }
                                  break;
                              }
                            },
                            child: Container(
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
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(14),
                            child: Text(
                              "Cipher Generated :",
                              style: TextStyle(
                                  color: MyColors.white, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            padding: EdgeInsets.all(14),
                            child: TextField(
                                controller: _decryptedTextController,
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
                          widget.selectedTab == 0
                              ? Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Shift :",
                                        style: TextStyle(
                                            color: MyColors.white,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 25),
                                        margin: EdgeInsets.only(
                                            left: size.width * 0.01),
                                        child: DropdownButton<String>(
                                          style: TextStyle(
                                              color: Color(0xff9D9D9D)),
                                          value: dropDownShift,
                                          // style: TextStyle(color: Colors.deepPurple),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropDownShift = newValue;
                                            });
                                          },
                                          items: numbers
                                              .map<DropdownMenuItem<String>>(
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
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Keyword :",
                                        style: TextStyle(
                                            color: MyColors.white,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Container(
                                          width: size.width * 0.55,
                                          margin: EdgeInsets.only(
                                              left: size.width * 0.01),
                                          child: TextField(
                                              controller:
                                                  _keywordTextController,
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: MyColors.white),
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: MyColors.white),
                                                  ),
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xffB3B3B3)),
                                                  // hintText: 'abc@def.com',
                                                  hintText:
                                                      "Enter a keyword"))),
                                    ],
                                  ),
                                ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          GestureDetector(
                            onTap: () async {
                              switch (widget.selectedTab) {
                                case 0:
                                  {
                                    if (_cipherTextController.text
                                        .trim()
                                        .isNotEmpty) {
                                      await Spyder.decryptUsingCaesarCipher(
                                              _cipherTextController.text.trim(),
                                              dropDownShift)
                                          .then((value) {
                                        setState(() {
                                          _decryptedTextController.text = value;
                                        });
                                        return null;
                                      });
                                    }
                                  }
                                  break;
                                case 1:
                                  {
                                    if (_cipherTextController.text
                                        .trim()
                                        .isNotEmpty) {
                                      if (Validation().validationForHillCipher(
                                              _cipherTextController.text
                                                  .trim()) ==
                                          "true") {
                                        await Spyder.decryptUsingHillCipher(
                                                _cipherTextController.text
                                                    .trim(),
                                                _keywordTextController.text
                                                    .trim())
                                            .then((value) {
                                          setState(() {
                                            _decryptedTextController.text =
                                                value;
                                          });
                                          return null;
                                        });
                                      } else {
                                        //error
                                      }
                                    }
                                  }
                                  break;
                                case 2:
                                  {
                                    if (_cipherTextController.text
                                        .trim()
                                        .isNotEmpty) {
                                      await Spyder.decryptUsingRailFenceCipher(
                                              _cipherTextController.text.trim(),
                                              double.parse(
                                                      _keywordTextController
                                                          .text
                                                          .trim())
                                                  .toInt())
                                          .then((value) {
                                        setState(() {
                                          _decryptedTextController.text = value;
                                        });
                                        return null;
                                      });
                                    }
                                  }
                                  break;
                                case 3:
                                  {
                                    if (_cipherTextController.text
                                        .trim()
                                        .isNotEmpty) {
                                      if (Validation().validationForVignere(
                                              _cipherTextController.text
                                                  .trim()) ==
                                          "true") {
                                        await Spyder.decryptUsingVignereCipher(
                                                _cipherTextController.text
                                                    .trim(),
                                                _keywordTextController.text
                                                    .trim())
                                            .then((value) {
                                          setState(() {
                                            _decryptedTextController.text =
                                                value;
                                          });
                                          return null;
                                        });
                                      } else {
                                        //error
                                      }
                                    }
                                  }
                                  break;
                                case 4:
                                  {
                                    if (_cipherTextController.text
                                        .trim()
                                        .isNotEmpty) {
                                      if (Validation().validationForPlayFair(
                                              _cipherTextController.text
                                                  .trim()) ==
                                          "true") {
                                        await Spyder.decryptUsingPlayFairCipher(
                                                _cipherTextController.text
                                                    .trim(),
                                                _keywordTextController.text
                                                    .trim())
                                            .then((value) {
                                          setState(() {
                                            _decryptedTextController.text =
                                                value;
                                          });
                                          return null;
                                        });
                                      } else {
                                        //error
                                      }
                                    }
                                  }
                                  break;
                              }
                            },
                            child: Container(
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
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(14),
                            child: Text(
                              "Plain text Generated :",
                              style: TextStyle(
                                  color: MyColors.white, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            padding: EdgeInsets.all(14),
                            child: TextField(
                                controller: _decryptedTextController,
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
      ),
    );
  }
}

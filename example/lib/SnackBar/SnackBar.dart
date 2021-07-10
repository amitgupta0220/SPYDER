import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spyder_example/Style/MyColors.dart';

class ShowSnackBar {
  showSnackBar({BuildContext context, String content}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        content,
        style: TextStyle(
          color: MyColors.white,
        ),
      ),
      elevation: 0,
      duration: Duration(seconds: 1),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5), topLeft: Radius.circular(5))),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/color_helper.dart';

class Style {
  static OutlineInputBorder inputBorder() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.white54,
          width: 1,
        ));
  }

  static OutlineInputBorder focusBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: ColorHelper.secondaryColor,
          width: 1,
        ));
  }

  static TextStyle largeInputText() {
    //30.sp : 15.sp
    return TextStyle(
        fontSize:
            ScreenUtil().orientation == Orientation.portrait ? 25.sp : 15.sp,
        color: Colors.black,
        // color: Colors.white,
        fontWeight: FontWeight.bold);
  }
}

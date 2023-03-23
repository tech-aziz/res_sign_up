import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_size.dart';

class Constants{
  //FONT SIZES
    static double largeFontSizeCreateAccount =
      ScreenUtil().orientation == Orientation.portrait ? CustomSize.customSize(
                    portPhone: 22.h,
                    portTablet: 30.h,
                    portDesktop: 0.h,
                    landPhone: 770.h,
                    landTablet: 0.h,
                    landDestop: 0.h) :
                    
                    ScreenUtil().orientation == Orientation.landscape ? CustomSize.customSize(
                    portPhone: 30.h,
                    portTablet: 0.h,
                    portDesktop: 0.h,
                    landPhone: 0.h,
                    landTablet: 35.h,
                    landDestop: 0.h) : 0 ;
}
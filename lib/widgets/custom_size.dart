import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_services.dart';

class CustomSize{
  static double customSize(
    {portPhone, portTablet, portDesktop, landPhone, landTablet, landDestop}) {
  final screenOrientation = ScreenUtil().orientation;
  final deviceType = AppServices.getDeviceType();

  double actualSize = 0;

  if (screenOrientation == Orientation.portrait) {
    if (deviceType == DeviceType.phone) {
      actualSize = portPhone;
    } else if (deviceType == DeviceType.tablet) {
      actualSize = portTablet;
    } else if (deviceType == DeviceType.desktop) {
      actualSize = portDesktop;
    }
  } else if (screenOrientation == Orientation.landscape) {
    if (deviceType == DeviceType.phone) {
      actualSize = landPhone;
    } else if (deviceType == DeviceType.tablet) {
      actualSize = landTablet;
    } else if (deviceType == DeviceType.desktop) {
      actualSize = landDestop;
    }
  }

  return actualSize;
}
}
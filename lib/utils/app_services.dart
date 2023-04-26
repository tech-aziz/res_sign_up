import 'package:flutter/cupertino.dart';

enum DeviceType { phone, tablet, desktop }

class AppServices {

  static DeviceType getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    if (data.size.shortestSide < 550) {
      return DeviceType.phone;
    } else if (data.size.shortestSide > 550 && data.size.shortestSide <= 800) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
    // return data.size.shortestSide < 550 ? DeviceType.phone : DeviceType.tablet;
  }
}
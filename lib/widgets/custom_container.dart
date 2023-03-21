import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../global/styles.dart';
import '../utils/app_services.dart';
import '../utils/color_helper.dart';
import '../utils/constants.dart';

Widget customContainer() {
  TextEditingController _companyNameTextController = TextEditingController();
  TextEditingController _companyAddressTextController = TextEditingController();
  TextEditingController _companyPhoneTextController = TextEditingController();
  TextEditingController _companyEmailTextController = TextEditingController();
  TextEditingController _companyPasswordTextController =
      TextEditingController();
  TextEditingController _companyConfirmPasswordTextController =
      TextEditingController();

  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 80),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 7,
                spreadRadius: 5,
                color: Colors.grey.withOpacity(0.5),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().orientation == Orientation.portrait
                    ? AppServices.getDeviceType() == DeviceType.phone
                        ? 500.h
                        : 600.h
                    : 370.h,


                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: Padding(
                    padding: EdgeInsets.only(top: customPaddingSize()),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: TextField(
                                  controller: _companyNameTextController,
                                  keyboardType: TextInputType.name,
                                  // maxLength: 30,
                                  decoration: InputDecoration(
                                    labelText: 'Restaurant Name',
                                    prefixIcon: const Icon(Icons.keyboard),
                                    enabledBorder: Style.inputBorder(),
                                    focusedBorder: Style.focusBorder(),
                                  ),
                                  style: Style.largeInputText(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: TextField(
                                  controller: _companyAddressTextController,
                                  keyboardType: TextInputType.streetAddress,
                                  // maxLength: 160,
                                  minLines: 1,
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    labelText: 'Address',
                                    prefixIcon: const Icon(Icons.location_on),
                                    enabledBorder: Style.inputBorder(),
                                    focusedBorder: Style.focusBorder(),
                                  ),
                                  style: Style.largeInputText(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: TextField(
                                  controller: _companyPhoneTextController,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  // maxLength: 11,
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                    prefixIcon: const Icon(Icons.phone),
                                    enabledBorder: Style.inputBorder(),
                                    focusedBorder: Style.focusBorder(),
                                  ),
                                  style: Style.largeInputText(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: TextField(
                                  controller: _companyEmailTextController,
                                  keyboardType: TextInputType.emailAddress,
                                  // maxLength: 50,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: const Icon(Icons.mail),
                                    enabledBorder: Style.inputBorder(),
                                    focusedBorder: Style.focusBorder(),
                                  ),
                                  style: Style.largeInputText(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: TextField(
                                  controller: _companyPasswordTextController,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  // maxLength: 50,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    prefixIcon: const Icon(Icons.lock),
                                    enabledBorder: Style.inputBorder(),
                                    focusedBorder: Style.focusBorder(),
                                  ),
                                  style: Style.largeInputText(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 32),
                                child: TextField(
                                  controller:
                                      _companyConfirmPasswordTextController,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  // maxLength: 50,
                                  decoration: InputDecoration(
                                    labelText: 'Confirm Password',
                                    prefixIcon: const Icon(Icons.lock),
                                    enabledBorder: Style.inputBorder(),
                                    focusedBorder: Style.focusBorder(),
                                  ),
                                  style: Style.largeInputText(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: ScreenUtil().orientation ==
                                  Orientation.landscape
                              ? AppServices.getDeviceType() == DeviceType.phone
                                  ? 50
                                  : 60.h
                              : 35.h,
                          width:
                              ScreenUtil().orientation == Orientation.landscape
                                  ? 310.w
                                  : 200.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    ColorHelper.secondaryOrangeColor),
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      Constants.largeFontSizeCreateAccount),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: -60,
            child: Container(
                height: 115,
                width: 115,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      blurRadius: 7,
                      spreadRadius: 5,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    // Navigator.of(context).pop();
                  },
                  child: const Image(
                    image: ResizeImage(
                        AssetImage('assets/images/camera-plus-svgrepo-com.png'),
                        width: 65,
                        height: 65),
                  ),
                )))
      ],
    ),
  );
}

double customPaddingSize() {
  final screenOrientation = ScreenUtil().orientation;
  final deviceType = AppServices.getDeviceType();

  double paddingSize = 0;

  if (screenOrientation == Orientation.portrait) {
    if (deviceType == DeviceType.phone) {
      paddingSize = 55.h;
    } else if (deviceType == DeviceType.tablet) {
      paddingSize = 30.h;
    } else if (deviceType == DeviceType.desktop) {
      paddingSize = 20.h;
    }
  } else if (screenOrientation == Orientation.landscape) {
    if (deviceType == DeviceType.phone) {
      paddingSize = 125.h;
    } else if (deviceType == DeviceType.tablet) {
      paddingSize = 10.h;
    } else if (deviceType == DeviceType.desktop) {
      paddingSize = 160.h;
    }
  }

  return paddingSize;
}

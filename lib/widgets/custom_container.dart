import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../global/styles.dart';
import '../utils/app_services.dart';
import '../utils/color_helper.dart';
import '../utils/constants.dart';
import 'custom_size.dart';

Widget customContainer() {

  TextEditingController _companyNameTextController = TextEditingController();
  TextEditingController _companyAddressTextController = TextEditingController();
  TextEditingController _companyPhoneTextController = TextEditingController();
  TextEditingController _companyEmailTextController = TextEditingController();
  TextEditingController _companyPasswordTextController = TextEditingController();
  TextEditingController _companyConfirmPasswordTextController = TextEditingController();

  return Padding(
    padding: EdgeInsets.only(
      left: ScreenUtil().orientation == Orientation.portrait
          ? AppServices.getDeviceType() == DeviceType.phone
              ? 20.h
              : 20.h
          : 20.h,
      right: ScreenUtil().orientation == Orientation.portrait
          ? AppServices.getDeviceType() == DeviceType.phone
              ? 20.h
              : 20.h
          : 20.h,
      bottom: ScreenUtil().orientation == Orientation.portrait
          ? AppServices.getDeviceType() == DeviceType.phone
              ? 20.h
              : 20.h
          : 20.h,
      top: ScreenUtil().orientation == Orientation.portrait
          ? AppServices.getDeviceType() == DeviceType.phone
              ? 170.h
              : 220.h
          : 300.h,
    ),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                blurRadius: 7.r,
                spreadRadius: 5.r,
                color: Colors.grey.withOpacity(0.5),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: CustomSize.customSize(
                    portPhone: 800.h,
                    portTablet: 800.h,
                    portDesktop: 500.h,
                    landPhone: 770.h,
                    landTablet: 700.h,
                    landDestop: 500.h),
                // height: ScreenUtil().orientation == Orientation.portrait
                //     ? AppServices.getDeviceType() == DeviceType.phone
                //         ? 550.h
                //         : 600.h
                //     : 500.h,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: CustomSize.customSize(
                            portPhone: 60.h,
                            portTablet: 90.h,
                            portDesktop: 0.h,
                            landPhone: 125.h,
                            landTablet: 70.h,
                            landDestop: 160.h)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          height: ScreenUtil().orientation ==
                                  Orientation.landscape
                              ? AppServices.getDeviceType() == DeviceType.phone
                                  ? 40
                                  : 50.h
                              : 60.h,
                          width:
                              ScreenUtil().orientation == Orientation.landscape
                                  ? 750.w
                                  : 665.w,
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
                        SizedBox(
                          height: 25.h,
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
                height: ScreenUtil().orientation == Orientation.portrait &&
                        AppServices.getDeviceType() == DeviceType.phone
                    ? 140.h
                    : ScreenUtil().orientation == Orientation.portrait &&
                            AppServices.getDeviceType() == DeviceType.tablet
                        ? 150.h
                        : ScreenUtil().orientation == Orientation.portrait &&
                                AppServices.getDeviceType() ==
                                    DeviceType.desktop
                            ? 100.h
                            : ScreenUtil().orientation ==
                                        Orientation.landscape &&
                                    AppServices.getDeviceType() ==
                                        DeviceType.phone
                                ? 300.h
                                : ScreenUtil().orientation ==
                                            Orientation.landscape &&
                                        AppServices.getDeviceType() ==
                                            DeviceType.tablet
                                    ? 155.h
                                    : ScreenUtil().orientation ==
                                                Orientation.landscape &&
                                            AppServices.getDeviceType() ==
                                                DeviceType.desktop
                                        ? 400.h
                                        : 100.h,

                // customSize(
                //     portPhone: 140.h,
                //     portTablet: 0.h,
                //     portDesktop: 40.h,
                //     landPhone: 250.h,
                //     landTablet: 110.h,
                //     landDestop: 160.h),
                // width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      blurRadius: 7.r,
                      spreadRadius: 5.r,
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

// double customPaddingSize() {
//   final screenOrientation = ScreenUtil().orientation;
//   final deviceType = AppServices.getDeviceType();

//   double paddingSize = 0;

//   if (screenOrientation == Orientation.portrait) {
//     if (deviceType == DeviceType.phone) {
//       paddingSize = 55.h;
//     } else if (deviceType == DeviceType.tablet) {
//       paddingSize = 30.h;
//     } else if (deviceType == DeviceType.desktop) {
//       paddingSize = 20.h;
//     }
//   } else if (screenOrientation == Orientation.landscape) {
//     if (deviceType == DeviceType.phone) {
//       paddingSize = 125.h;
//     } else if (deviceType == DeviceType.tablet) {
//       paddingSize = 10.h;
//     } else if (deviceType == DeviceType.desktop) {
//       paddingSize = 160.h;
//     }
//   }

//   return paddingSize;
// }

//To manage size for page orientation



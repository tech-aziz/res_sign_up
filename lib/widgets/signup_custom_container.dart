import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../global/styles.dart';
import '../screens/login.dart';
import '../screens/sign_up_repository.dart';
import '../utils/app_services.dart';
import '../utils/color_helper.dart';
import '../utils/constants.dart';
import '../utils/snack_messages.dart';
import 'custom_size.dart';

Widget signUpCustomContainer({
  required TextEditingController companyNameTextController,
  required TextEditingController companyAddressTextController,
  required TextEditingController companyPhoneTextController,
  required TextEditingController companyEmailTextController,
  required TextEditingController companyPasswordTextController,
  required TextEditingController companyConfirmPasswordTextController,
}) {
  SignUpRepository signUp = SignUpRepository();
  // final formKey = GlobalKey<FormState>();

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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Padding(
              padding: EdgeInsets.only(
                  top: CustomSize.customSize(
                      portPhone: 60.h,
                      portTablet: 95.h,
                      portDesktop: 0.h,
                      landPhone: 125.h,
                      landTablet: 81.h,
                      landDestop: 160.h)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            onChanged: (String value) {},
                            // validator: (value) {
                            //   if (value!.isEmpty ||
                            //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            //     return ' Enter currect restaurant name';
                            //   }
                            //   return null;
                            // },
                            controller: companyNameTextController,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: companyAddressTextController,
                            keyboardType: TextInputType.streetAddress,
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter address';
                            //   }
                            //   return null;
                            // },
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: companyPhoneTextController,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: companyEmailTextController,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: companyPasswordTextController,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: companyConfirmPasswordTextController,
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
                    height: ScreenUtil().orientation == Orientation.landscape
                        ? AppServices.getDeviceType() == DeviceType.phone
                            ? 40
                            : 78.h
                        : 60.h,
                    width: ScreenUtil().orientation == Orientation.landscape
                        ? 750.w
                        : 665.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorHelper.secondaryOrangeColor),
                      onPressed: () {
                        if (companyNameTextController.text.isEmpty) {
                          //show snackbar
                          SnackMessage.showSuccess('Name is required');
                        }
                        if (companyPhoneTextController.text.isEmpty) {
                          //show snackbar
                          SnackMessage.showSuccess('Phone is required');
                        }
                        if (companyAddressTextController.text.isEmpty) {
                          //show snackbar
                          SnackMessage.showSuccess('Address is required');
                        }
                        if (companyEmailTextController.text.isEmpty) {
                          //show snackbar
                          SnackMessage.showSuccess('Email is required');
                        }
                        if (companyPasswordTextController.text.isEmpty) {
                          //show snackbar
                          SnackMessage.showSuccess('Password is required');
                        } else {
                          signUp.createRestaurant(
                              companyNameTextController.text,
                              companyPhoneTextController.text,
                              companyAddressTextController.text,
                              companyEmailTextController.text,
                              companyPasswordTextController.text);
                          print('sign up successfully done');
                          SnackMessage.showSuccess('Sign up successfully done');
                          Get.to(() => const LoginScreen());
                          FocusManager.instance.primaryFocus?.unfocus();

                          //clear filed
                          companyNameTextController.clear();
                          companyPhoneTextController.clear();
                          companyAddressTextController.clear();
                          companyEmailTextController.clear();
                          companyPasswordTextController.clear();
                          companyConfirmPasswordTextController.clear();
                        }
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Constants.largeFontSizeCreateAccount),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Have an account?',
                                  style: Style.largeInputText()),
                              TextSpan(
                                  text: ' Sign in',
                                  style: const TextStyle(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Login Text Clicked');
                                      Get.to(() => const LoginScreen());
                                    }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
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
                                    ? 170.h
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

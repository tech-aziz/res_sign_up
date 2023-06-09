import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../global/styles.dart';
import '../screens/login_repository.dart';
import '../screens/sign_up.dart';
import '../screens/sign_up_copy.dart';
import '../utils/app_services.dart';
import '../utils/color_helper.dart';
import 'custom_size.dart';

Widget signInCustomContainer({
  required TextEditingController companyEmailTextController,
  required TextEditingController companyPasswordTextController,
  required GlobalKey<FormState> formKey,
}) {
  LoginRepository signIn = LoginRepository(
    companyEmailTextController: companyEmailTextController.text,
    companyPasswordTextController: companyPasswordTextController.text,
  );
  String email, password;

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
            color: Colors.transparent,
            // color: Colors.white,
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: companyEmailTextController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter a email';
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return 'Please Enter a valid Email';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              email = value!;
                            },
                            // maxLength: 50,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.mail),
                              // enabledBorder: OutlineInputBorder(),
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
                          child: TextFormField(
                            controller: companyPasswordTextController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter a Password';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              password = value!;
                            },
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
                        if (formKey.currentState!.validate()) {
                          signIn.createLogin(companyEmailTextController.text,
                              companyPasswordTextController.text);

                          FocusManager.instance.primaryFocus?.unfocus();

                          //clear filed
                          companyEmailTextController.clear();
                          companyPasswordTextController.clear();
                        }
                      },
                      child: Text(
                        'Sign in',
                        style: Style.largeInputText(),
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
                                  text: 'Have\'t an account?',
                                  style: Style.largeInputText()),
                              TextSpan(
                                  text: ' Sign up',
                                  style: const TextStyle(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                       Get.to(SignUp());
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
                //     landDesktop: 160.h),
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
                    image: ResizeImage(AssetImage('assets/images/person.png'),
                        width: 60, height: 60),
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

import 'dart:developer';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../global/image_picker_bottom_sheet.dart';
import '../global/image_picker_bottom_sheet.dart';
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
  required GlobalKey<FormState> formKey,
}) {
  SignUpRepository signUp = SignUpRepository();
  String name, address, phone, email, password, confirmPassword;
  // ImagePick imagePick = ImagePick();
  // var actualImage = ImagePick.seletedImagePath;

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
            child: Form(
              key: formKey,
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter restaurant name';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                name = value!;
                              },
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
                            child: TextFormField(
                              controller: companyAddressTextController,
                              keyboardType: TextInputType.streetAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter address';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                address = value!;
                              },
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
                            child: TextFormField(
                              controller: companyPhoneTextController,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              // maxLength: 11,
                              validator: (value) {
                                if (value!.length != 11) {
                                  return 'Mobile Number must be of 11 digit';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                phone = value!;
                              },
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
                            child: TextFormField(
                              controller: companyEmailTextController,
                              keyboardType: TextInputType.emailAddress,
                              // maxLength: 50,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: companyConfirmPasswordTextController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please re-enter password';
                                }
                                print(companyPasswordTextController.text);

                                print(
                                    companyConfirmPasswordTextController.text);

                                if (companyPasswordTextController.text !=
                                    companyConfirmPasswordTextController.text) {
                                  return "Password does not match";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                confirmPassword = value!;
                              },
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
                          if (formKey.currentState!.validate()) {
                            signUp.createRestaurant(
                                companyNameTextController.text,
                                companyPhoneTextController.text,
                                companyAddressTextController.text,
                                companyEmailTextController.text,
                                companyPasswordTextController.text);
                            print('sign up successfully done');
                            SnackMessage.showSuccess('Sign up successfully!');
                            Get.to(() => const LoginScreen());
                            FocusManager.instance.primaryFocus?.unfocus();

                            //clear filed
                            companyNameTextController.clear();
                            companyPhoneTextController.clear();
                            companyAddressTextController.clear();
                            companyEmailTextController.clear();
                            companyPasswordTextController.clear();
                            companyConfirmPasswordTextController.clear();

                            return;
                          } else {
                            print("UnSuccessful");
                            SnackMessage.showError('All field required!');
                          }
                        },

                        // onPressed: () {
                        //   if (companyNameTextController.text.isEmpty) {
                        //     //show snackbar
                        //     SnackMessage.showSuccess('Name is required');
                        //   }
                        //   if (companyPhoneTextController.text.isEmpty) {
                        //     //show snackbar
                        //     SnackMessage.showSuccess('Phone is required');
                        //   }
                        //   if (companyAddressTextController.text.isEmpty) {
                        //     //show snackbar
                        //     SnackMessage.showSuccess('Address is required');
                        //   }
                        //   if (companyEmailTextController.text.isEmpty) {
                        //     //show snackbar
                        //     SnackMessage.showSuccess('Email is required');
                        //   }
                        //   if (companyPasswordTextController.text.isEmpty) {
                        //     //show snackbar
                        //     SnackMessage.showSuccess('Password is required');
                        //   } else {
                        //     signUp.createRestaurant(
                        //         companyNameTextController.text,
                        //         companyPhoneTextController.text,
                        //         companyAddressTextController.text,
                        //         companyEmailTextController.text,
                        //         companyPasswordTextController.text);
                        //     print('sign up successfully done');
                        //     SnackMessage.showSuccess('Sign up successfully done');
                        //     Get.to(() => const LoginScreen());
                        //     FocusManager.instance.primaryFocus?.unfocus();
                        //
                        //     //clear filed
                        //     companyNameTextController.clear();
                        //     companyPhoneTextController.clear();
                        //     companyAddressTextController.clear();
                        //     companyEmailTextController.clear();
                        //     companyPasswordTextController.clear();
                        //     companyConfirmPasswordTextController.clear();
                        //   }
                        // },

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
        ),
        Positioned(
            top: -60,
            child: InkWell(
              onTap: () {
                // Navigator.of(context).pop();
                log('clicked');
                // ImagePick.imagePickerOption();
                ImagePick.imagePickerOptionWithReturn();
                // print('image is clicked');
                // Get.snackbar('photo', 'Take image');
              },
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
                // child: actualImage == ''
                //     ? const Image(
                //         image: ResizeImage(
                //             AssetImage(
                //                 'assets/images/camera-plus-svgrepo-com.png'),
                //             width: 65,
                //             height: 65))
                //     : CircleAvatar(
                //       child: Image.file(
                //           File(actualImage),
                //           fit: BoxFit.cover,
                //         ),
                //     ),
                
                child: const Image(
                  image: ResizeImage(
                      AssetImage('assets/images/camera-plus-svgrepo-com.png'),
                      width: 65,
                      height: 65),
                )

              ),
            ))
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

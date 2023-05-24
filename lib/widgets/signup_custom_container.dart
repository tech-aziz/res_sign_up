import 'dart:io';

import 'package:camera/camera.dart';
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
import '../utils/snack_messages.dart';
import 'custom_size.dart';

Widget signUpCustomContainer({
  required TextEditingController companyNameTextController,
  required TextEditingController companyAddressTextController,
  required TextEditingController companyPhoneTextController,
  required TextEditingController companyEmailTextController,
  required TextEditingController companyPasswordTextController,
  required TextEditingController companyConfirmPasswordTextController,
  // required Uint8List image,
  required GlobalKey<FormState> formKey,
}) {
  SignUpRepository signUp = SignUpRepository();
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
              ? 110.h
              : 220.h
          : 300.h,
    ),
    child: Stack(
      // ei stack er under e position neya...sekhane...ektow dekhen...
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            // color: Colors.white,
            color: Colors.transparent,
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
                              onSaved: (value) {},
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
                              onSaved: (value) {},
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
                              onSaved: (value) {},
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
                              onSaved: (value) {},
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
                              onSaved: (value) {},
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
                              onSaved: (value) {},
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
                            // backgroundColor: ColorHelper.secondaryOrangeColor
                          backgroundColor: Colors.transparent
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            signUp.createRestaurant(
                                companyNameTextController.text,
                                companyPhoneTextController.text,
                                companyAddressTextController.text,
                                companyEmailTextController.text,
                                companyPasswordTextController.text,

                              // imageFile
                            );
                            print('sign up successfully done');
                            SnackMessage.showSuccess('Sign up successfully!');
                            Get.to(() =>  LoginScreen());
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
                        child: Text(
                          'Create Account',
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
                                        Get.to(() => LoginScreen());
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
      ],
    ),
  );
}

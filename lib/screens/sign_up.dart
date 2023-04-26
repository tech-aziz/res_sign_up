import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../global/image_picker_bottom_sheet.dart';
import '../utils/app_services.dart';
import '../widgets/signup_custom_container.dart';
import '../widgets/custom_size.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _companyNameTextController =
      TextEditingController();
  final TextEditingController _companyAddressTextController =
      TextEditingController();
  final TextEditingController _companyPhoneTextController =
      TextEditingController();
  final TextEditingController _companyEmailTextController =
      TextEditingController();
  final TextEditingController _companyPasswordTextController =
      TextEditingController();
  final TextEditingController _companyConfirmPasswordTextController =
      TextEditingController();
  static final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _companyNameTextController.dispose();
    _companyAddressTextController.dispose();
    _companyPhoneTextController.dispose();
    _companyEmailTextController.dispose();
    _companyPasswordTextController.dispose();
    _companyConfirmPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: CustomSize.customSize(
                  portPhone: 350.h,
                  portTablet: 320.h,
                  portDesktop: 10.h,
                  landPhone: 560.h,
                  landTablet: 400.h,
                  landDestop: 160.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.r),
                    bottomLeft: Radius.circular(25.r)),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 3),
                    blurRadius: 7.r,
                    spreadRadius: 5.r,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ],
              ),
            ),
            Positioned(
              child: SafeArea(
                child: SizedBox(
                  height: CustomSize.customSize(
                      portPhone: 1450.h,
                      portTablet: 1100.h,
                      portDesktop: 0.h,
                      landPhone: 1150.h,
                      landTablet: 1150.h,
                      landDestop: 0.h),
                  child: signUpCustomContainer(
                      companyNameTextController: _companyNameTextController,
                      companyAddressTextController:
                          _companyAddressTextController,
                      companyEmailTextController: _companyEmailTextController,
                      companyPhoneTextController: _companyPhoneTextController,
                      companyPasswordTextController:
                          _companyPasswordTextController,
                      companyConfirmPasswordTextController:
                          _companyConfirmPasswordTextController,
                      formKey: _formKey),
                ),
              ),
            ),
            Positioned(
                top: 100,
                child: GestureDetector(
                  onTap: ()async {
                    log('clicked');
                    // ImagePick.imagePickerOption();
                    ImagePick.imagePickerOptionWithReturn();
                  },
                  child: Container(
                      height: ScreenUtil().orientation ==
                                  Orientation.portrait &&
                              AppServices.getDeviceType() == DeviceType.phone
                          ? 140.h
                          : ScreenUtil().orientation == Orientation.portrait &&
                                  AppServices.getDeviceType() ==
                                      DeviceType.tablet
                              ? 150.h
                              : ScreenUtil().orientation ==
                                          Orientation.portrait &&
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
                      decoration: BoxDecoration(
                        // color: Colors.white,
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
                      child: const Image(
                        image: ResizeImage(
                            AssetImage(
                                'assets/images/camera-plus-svgrepo-com.png'),
                            width: 83,
                            height: 83),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}

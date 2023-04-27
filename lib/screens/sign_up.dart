import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  static File? images;

  void imagePickerOptionWithReturn() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: ScreenUtil().orientation == Orientation.portrait
                ? 200.h
                : AppServices.getDeviceType() == DeviceType.phone
                    ? 500.h
                    : 350.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pick Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              pickImage(ImageSource.camera);
                              Get.back();
                            },
                            child: Container(
                              height: 60.w,
                              width: 60.w,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 35.sp,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(
                                fontSize: ScreenUtil().orientation ==
                                        Orientation.portrait
                                    ? 20
                                    : 16),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              pickImage(ImageSource.gallery);
                              Get.back();
                            },
                            child: Container(
                              height: 60.w,
                              width: 60.w,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.photo,
                                size: 35.sp,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(
                                fontSize: ScreenUtil().orientation ==
                                        Orientation.portrait
                                    ? 20
                                    : 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource source) async {
    try {
      final image =
          await ImagePicker().pickImage(source: source, imageQuality: 10);
      if (image == null) {
        return;
      } else {
        final takeImage = File(image.path);
        setState(() => images = takeImage);
      }
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

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
                top: 70,
                child: GestureDetector(
                  onTap: () async {
                    log('clicked');
                    // ImagePick.imagePickerOption();
                    imagePickerOptionWithReturn();
                  },
                  child: Container(
                    height: ScreenUtil().orientation == Orientation.portrait &&
                            AppServices.getDeviceType() == DeviceType.phone
                        ? 140.h
                        : ScreenUtil().orientation == Orientation.portrait &&
                                AppServices.getDeviceType() == DeviceType.tablet
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
                    child: images != null

                        // ? CircleAvatar(
                        //     radius: 83,
                        //     child: Image.file(images!,
                        //         fit: BoxFit.cover, width: 83, height: 83),
                        //   )

                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(images!,
                              fit: BoxFit.cover, width: 83, height: 83),
                        )

                        : const Image(
                            image: ResizeImage(
                                AssetImage(
                                    "assets/images/camera-plus-svgrepo-com.png"),
                                width: 83,
                                height: 83)),

                    // child: Image(
                    //   image: images =! null ? Image.file(images): ResizeImage(
                    //       AssetImage(
                    //           'assets/images/camera-plus-svgrepo-com.png'),
                    //       width: 83,
                    //       height: 83)
                    // )
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

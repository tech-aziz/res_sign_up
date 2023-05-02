import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/app_services.dart';
import '../utils/color_helper.dart';
import '../utils/snack_messages.dart';
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

  void imagePickerOption() {
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

// ei function ta diye to vai may be korte hobe...but kemne bujtecina.// database a image ta upload korar function to likha lagbe vai

  Future pickImage(ImageSource source) async {
    try {
      final image =
          await ImagePicker().pickImage(source: source, imageQuality: 10);
      if (image == null) {
        return;
      } else {
        final takeImage = File(image.path);

        // Uint8List bytes = await takeImage.readAsBytes();
        // final String value = base64Encode(bytes);
        //ekhane database a upload korte hobe image ta.hum vai but oitai korte parchi nah....kono vabei.
        //function gula banano ache amader project a oigula dekhen
        //sqflite a data updata er moto e normally data update korben
        //ami to vai create button a click korle textfiled er datagula database e store kortechi ....thaole oi function ta dekhben ektow..?
        // textfield er data to jacche database a akn just image er bytes value ta image column a update korben. vai ei update er kaj apnake korte hobe.
        //sqflite er update just...apnar kace to just vai amr kace hardly matter...nah parle vai apni ektow dekhai diyen.

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
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: ScreenUtil().orientation == Orientation.portrait
                  ? 300.w
                  : 150.w, // width is not set yet.
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
              child: SizedBox(
                height: ScreenUtil().orientation == Orientation.portrait
                    ? ScreenUtil().screenHeight
                    : ScreenUtil().screenHeight,
                child: signUpCustomContainer(
                    companyNameTextController: _companyNameTextController,
                    companyAddressTextController: _companyAddressTextController,
                    companyEmailTextController: _companyEmailTextController,
                    companyPhoneTextController: _companyPhoneTextController,
                    companyPasswordTextController:
                        _companyPasswordTextController,
                    companyConfirmPasswordTextController:
                        _companyConfirmPasswordTextController,
                    formKey: _formKey),
              ),
            ),
            Positioned(
                // top: 70,
                top: ScreenUtil().orientation == Orientation.portrait ? 70 : 50,
                child: images != null
                    ? Container(
                        width: ScreenUtil().orientation == Orientation.portrait
                            ? 150.w
                            : 100.w,
                        height: ScreenUtil().orientation == Orientation.portrait
                            ? 150.w
                            : 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              color: ColorHelper.secondaryOrangeColor,
                              width: 5),
                        ),
                        child: ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            child: Image.file(
                              images!,
                              fit: BoxFit.cover,
                            )))
                    : Container(
                        width: ScreenUtil().orientation == Orientation.portrait
                            ? 140.w
                            : 100.w,
                        height: ScreenUtil().orientation == Orientation.portrait
                            ? 140.w
                            : 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              color: ColorHelper.secondaryOrangeColor,
                              width: 5),
                        ),
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          child: Image.asset(
                            "assets/images/camera-plus-svgrepo-com.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),

            Positioned(
                top: 125.h,
                // top: -200.h,
                left: ScreenUtil().orientation == Orientation.portrait
                    ? 430.w
                    : 415.w,
                child: InkWell(
                  onTap: () {
                    imagePickerOption();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: ColorHelper.secondaryOrangeColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          width: 2, color: ColorHelper.secondaryOrangeColor),
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                )),

            // Positioned(
            //   top: 10.h,
            //   left: ScreenUtil().orientation == Orientation.portrait
            //       ? 105.w
            //       : 72.w,
            //   child: Column(
            //     children: [
            //       InkWell(
            //         onTap: () {
            //           // ImagePick().imagePickerOption(fromRestaurantInfo: true);
            //           // _settingsController.pickImage(false);
            //         },
            //         child: Container(
            //           padding: const EdgeInsets.all(2),
            //           height: 30,
            //           width: 30,
            //           decoration: BoxDecoration(
            //             color: ColorHelper.secondaryOrangeColor,
            //             borderRadius: BorderRadius.circular(50),
            //             border: Border.all(
            //                 width: 2, color: ColorHelper.secondaryOrangeColor),
            //           ),
            //           child: const Icon(
            //             Icons.edit,
            //             color: Colors.white,
            //             size: 20,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

//apni image khn upload korte cacche ? create account a click korar time a naki image pick korar por e ?
//image pic korar por poroi..vai mane click korar sathe sathei ok

//image pick korar por image upload er function ta kothy likhsen ?

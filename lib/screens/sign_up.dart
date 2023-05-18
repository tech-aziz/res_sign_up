import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:res_sign_up/database/database_info.dart';
import 'package:res_sign_up/database/init_database.dart';
import '../utils/app_services.dart';
import '../utils/color_helper.dart';
import '../widgets/signup_custom_container.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'sign_up_repository.dart';

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

  // var images

  /*second function for getting image*/
  // var imageFile;
  // var uploadImage;
  // final picker = ImagePicker();
  // Future<void> _getImage(ImageSource source) async {
  //   final XFile? xFile = await picker.pickImage(source: source);
  //   imageFile = xFile!.path.split('/').last;
  //   Uint8List bytes = await xFile.readAsBytes();
  //   uploadImage = base64Encode(bytes);
  //   setState(() {
  //     imageFile = File(uploadImage!.path);
  //   });
  //
  //   final database = await InitDatabase().open();
  //   await database.insert(
  //     DatabaseInfo.tableRestaurantInfo,
  //     {DatabaseInfo.columnRestaurantImage: imageFile!.path},
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  //
  //   if (imageFile != null) {
  //     Image.file(imageFile! as File);
  //   } else {
  //     return;
  //   }
  // }

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
                ? 220.h
                : AppServices.getDeviceType() == DeviceType.phone
                    ? 500.h
                    : 350.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Pick Image From",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        InkWell(
                          onTap: () {
                            print('delete is click');
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              getImage(ImageSource.camera);
                              // _getImage(ImageSource.camera);
                              Get.back();
                            },
                            child: Container(
                              height: 95.w,
                              width: 95.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1)),
                              child: Icon(
                                Icons.camera_alt_rounded,
                                size: 50.sp,
                                color: ColorHelper.secondaryOrangeColor,
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
                                    : 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              getImage(ImageSource.gallery);
                              // _getImage(ImageSource.gallery);
                              Get.back();
                            },
                            child: Container(
                              height: 95.w,
                              width: 95.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1)),
                              child: Icon(
                                Icons.photo,
                                size: 50.sp,
                                color: ColorHelper.secondaryOrangeColor,
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
                                    : 16,
                                fontWeight: FontWeight.normal),
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

  Future getImage(ImageSource source) async {
    try {
      final XFile? xFile =
          await ImagePicker().pickImage(source: source, imageQuality: 10);

      // here is the new code implemented

      // if (xFile != null) {
      //   Uint8List bytes = await xFile.readAsBytes();
      //   setState(() {
      //     image = base64Encode(bytes);
      //   });
      // }else{
      //   return;
      // }

      if (xFile == null) {
        return;
      } else {
        final takeImage = File(xFile.path);

        // Uint8List bytes = await takeImage.readAsBytes();
        // final String value = base64Encode(bytes);
        //ekhane database a upload korte hobe image ta.hum vai but oitai korte parchi nah....kono vabei.
        //function gula banano ache amader project a oigula dekhen
        //sqflite a data updata er moto e normally data update korben
        //ami to vai create button a click korle textfiled er datagula database e store kortechi ....thaole oi function ta dekhben ektow..?
        // textfield er data to jacche database a akn just image er bytes value ta image column a update korben. vai ei update er kaj apnake korte hobe.
        //sqflite er update just...apnar kace to just vai amr kace hardly matter...nah parle vai apni ektow dekhai diyen.

        setState(() => images = takeImage);
        // saveImage(images);
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
                      companyAddressTextController:
                          _companyAddressTextController,
                      companyEmailTextController: _companyEmailTextController,
                      companyPhoneTextController: _companyPhoneTextController,
                      companyPasswordTextController:
                          _companyPasswordTextController,
                      companyConfirmPasswordTextController:
                          _companyConfirmPasswordTextController,
                      // imageFile: imageFile,
                      formKey: _formKey),
                ),
              ),
              Positioned(
                  // top: 70,
                  top: ScreenUtil().orientation == Orientation.portrait
                      ? 70
                      : 50,
                  child: images != null
                      ? Container(
                          width:
                              ScreenUtil().orientation == Orientation.portrait
                                  ? 150.w
                                  : 100.w,
                          height:
                              ScreenUtil().orientation == Orientation.portrait
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
                          width:
                              ScreenUtil().orientation == Orientation.portrait
                                  ? 140.w
                                  : 100.w,
                          height:
                              ScreenUtil().orientation == Orientation.portrait
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
            ],
          ),
        ));
    // }

// void saveImage(path) async {
//   SharedPreferences saveImage = await SharedPreferences.getInstance();
//   saveImage.setString("image-path", path);
// }
  }
}

//apni image khn upload korte cacche ? create account a click korar time a naki image pick korar por e ?
//image pic korar por poroi..vai mane click korar sathe sathei ok

//image pick korar por image upload er function ta kothy likhsen ?

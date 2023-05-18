import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../settings/settings_controller.dart';
import '../utils/app_services.dart';
import '../utils/snack_messages.dart';

class ImagePick {
  final SettingsController _settingsController = Get.put(SettingsController());

  void imagePickerOption(
      {bool fromRestaurantInfo = false}) {
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
                            onTap: () {
                              cameraImagePicker(fromRestaurantInfo,
                                 );
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
                            onTap: () {
                              _settingsController.pickImage(
                                fromCamera: false,
                                fromRestaurantInfo: fromRestaurantInfo,
                                // fromLeftItem: fromLeftItem,
                                // selectedItem: selectedItem,
                              );
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

  //apni image database a update koren r akn ami ei kaj korte parbo na karon ei project a akjer cap akn
  //sesh kora lagbe project...thik ace thole vai....ami image tai database e store korte parchi nah....hmm ok vai

  void cameraImagePicker(bool fromRestaurantInfo) async {
    List len = await availableCameras();
    if (len.isEmpty) {
      SnackMessage.showError('Your device does not support camera service');
    } else {
      _settingsController.pickImage(
        fromCamera: true,
        fromRestaurantInfo: fromRestaurantInfo,
        // fromLeftItem: fromLeftItem,
        // selectedItem: selectedItem,
      );
    }
  }
}

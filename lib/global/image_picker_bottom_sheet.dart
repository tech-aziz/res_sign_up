import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/app_services.dart';
import '../utils/snack_messages.dart';

class ImagePick {
 static void imagePickerOption() {
   //apni dekhen ekthon.
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                                  onTap: () {},
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
                                    // _settingsController.pickImage(
                                    //   fromCamera: false,
                                    //   fromRestaurantInfo: fromRestaurantInfo,
                                    //   fromLeftItem: fromLeftItem,
                                    //   selectedItem: selectedItem,
                                    // );
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
                    )
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         InkWell(
                    //           onTap: () {
                    //             cameraImagePicker(
                    //                 fromRestaurantInfo, selectedItem, fromLeftItem);
                    //             Get.back();
                    //           },
                    //           child: Container(
                    //             height: 60.w,
                    //             width: 60.w,
                    //             decoration: BoxDecoration(
                    //               color: Colors.grey,
                    //               borderRadius: BorderRadius.circular(50),
                    //             ),
                    //             child: Icon(
                    //               Icons.camera_alt,
                    //               size: 35.sp,
                    //               color: Colors.grey[800],
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 10.h,
                    //         ),
                    //         Text(
                    //           'Camera',
                    //           style: TextStyle(
                    //               fontSize: ScreenUtil().orientation ==
                    //                   Orientation.portrait
                    //                   ? 20
                    //                   : 16),
                    //         ),
                    //       ],
                    //     ),
                    //     Column(
                    //       children: [
                    //         InkWell(
                    //           onTap: () {
                    //             _settingsController.pickImage(
                    //               fromCamera: false,
                    //               fromRestaurantInfo: fromRestaurantInfo,
                    //               fromLeftItem: fromLeftItem,
                    //               selectedItem: selectedItem,
                    //             );
                    //             Get.back();
                    //           },
                    //           child: Container(
                    //             height: 60.w,
                    //             width: 60.w,
                    //             decoration: BoxDecoration(
                    //               color: Colors.grey,
                    //               borderRadius: BorderRadius.circular(50),
                    //             ),
                    //             child: Icon(
                    //               Icons.photo,
                    //               size: 35.sp,
                    //               color: Colors.grey[800],
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: 10.h,
                    //         ),
                    //         Text(
                    //           'Gallery',
                    //           style: TextStyle(
                    //               fontSize: ScreenUtil().orientation ==
                    //                   Orientation.portrait
                    //                   ? 20
                    //                   : 16),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    ))),
      ),
    );
  }


 static void imagePickerOptionWithReturn() {
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
                             // await imagePickFromCamera();
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
                             // pickImageFromGallery();
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

 // imagePickFromCamera() async {
 //   List len = await availableCameras();
 //   if (len.isEmpty) {
 //     SnackMessage.showError('Your device does not support camera service');
 //   } else {
 //     if (image == '') {
 //       image = await _settingsController.pickImageForUpload(true);
 //     }
 //   }
 // }

 // pickImageFromGallery() {
 //   _settingsController.pickImageForUpload(false);
 // }
}

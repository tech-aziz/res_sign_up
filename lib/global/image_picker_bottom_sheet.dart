// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import '../utils/app_services.dart';
// import '../utils/snack_messages.dart';
// import 'package:camera/camera.dart';
// import 'package:permission_handler/permission_handler.dart';

// class ImagePick {
//   // static var seletedImagePath = '';
//   // static String image = '';
//   // static final ImagePicker _imagePicker = ImagePicker();
//   // static var hasImage = false;
//   // static var imageString = "";
//   // static var uploadImageString = '';
//   // static var imagePath = '';
//   static File? images;

//   // late AppStorage appStorage;

//   // static void imagePickerOption() {
//   //   Get.bottomSheet(
//   //     SingleChildScrollView(
//   //       child: ClipRRect(
//   //           borderRadius: const BorderRadius.only(
//   //             topLeft: Radius.circular(10.0),
//   //             topRight: Radius.circular(10.0),
//   //           ),
//   //           child: Container(
//   //               color: Colors.white,
//   //               height: ScreenUtil().orientation == Orientation.portrait
//   //                   ? 200.h
//   //                   : AppServices.getDeviceType() == DeviceType.phone
//   //                       ? 500.h
//   //                       : 350.h,
//   //               child: Padding(
//   //                   padding: const EdgeInsets.all(8.0),
//   //                   child: Column(
//   //                     mainAxisAlignment: MainAxisAlignment.center,
//   //                     crossAxisAlignment: CrossAxisAlignment.stretch,
//   //                     children: [
//   //                       const Text(
//   //                         "Pick Image From",
//   //                         style: TextStyle(
//   //                             fontSize: 20, fontWeight: FontWeight.bold),
//   //                         textAlign: TextAlign.center,
//   //                       ),
//   //                       SizedBox(
//   //                         height: 20.h,
//   //                       ),
//   //                       Row(
//   //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //                         children: [
//   //                           Column(
//   //                             mainAxisAlignment: MainAxisAlignment.center,
//   //                             children: [
//   //                               InkWell(
//   //                                 onTap: () async {
//   //                                   image = await imagePickFromCamera();

//   //                                   print('Image_Path:-');
//   //                                   print('Image_Path:-$image');
//   //                                   Get.back();
//   //                                   if (image != '') {
//   //                                   } else {
//   //                                     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //                                     //   content: Text("No Image Selected !"),
//   //                                     // ));
//   //                                   }

//   //                                   // if(seletedImagePath =! ''){

//   //                                   // }
//   //                                 },
//   //                                 child: Container(
//   //                                   height: 60.w,
//   //                                   width: 60.w,
//   //                                   decoration: BoxDecoration(
//   //                                     color: Colors.grey,
//   //                                     borderRadius: BorderRadius.circular(50),
//   //                                   ),
//   //                                   child: Icon(
//   //                                     Icons.camera_alt,
//   //                                     size: 35.sp,
//   //                                     color: Colors.grey[800],
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //                               SizedBox(
//   //                                 height: 10.h,
//   //                               ),
//   //                               Text(
//   //                                 'Camera',
//   //                                 style: TextStyle(
//   //                                     fontSize: ScreenUtil().orientation ==
//   //                                             Orientation.portrait
//   //                                         ? 20
//   //                                         : 16),
//   //                               ),
//   //                             ],
//   //                           ),
//   //                           Column(
//   //                             children: [
//   //                               InkWell(
//   //                                 onTap: () async {
//   //                                   // image =
//   //                                   //     await selectImageFromGallery();

//   //                                   print(image);
//   //                                   Get.back();
//   //                                 },
//   //                                 // onTap: () {
//   //                                 //   // _settingsController.pickImage(
//   //                                 //   //   fromCamera: false,
//   //                                 //   //   fromRestaurantInfo: fromRestaurantInfo,
//   //                                 //   //   fromLeftItem: fromLeftItem,
//   //                                 //   //   selectedItem: selectedItem,
//   //                                 //   // );
//   //                                 //   // Get.back();
//   //                                 // },
//   //                                 child: Container(
//   //                                   height: 60.w,
//   //                                   width: 60.w,
//   //                                   decoration: BoxDecoration(
//   //                                     color: Colors.grey,
//   //                                     borderRadius: BorderRadius.circular(50),
//   //                                   ),
//   //                                   child: Icon(
//   //                                     Icons.photo,
//   //                                     size: 35.sp,
//   //                                     color: Colors.grey[800],
//   //                                   ),
//   //                                 ),
//   //                               ),
//   //                               SizedBox(
//   //                                 height: 10.h,
//   //                               ),
//   //                               Text(
//   //                                 'Gallery',
//   //                                 style: TextStyle(
//   //                                     fontSize: ScreenUtil().orientation ==
//   //                                             Orientation.portrait
//   //                                         ? 20
//   //                                         : 16),
//   //                               ),
//   //                             ],
//   //                           ),
//   //                         ],
//   //                       ),
//   //                     ],
//   //                   )
//   //                   // Row(
//   //                   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //                   //   children: [
//   //                   //     Column(
//   //                   //       mainAxisAlignment: MainAxisAlignment.center,
//   //                   //       children: [
//   //                   //         InkWell(
//   //                   //           onTap: () {
//   //                   //             cameraImagePicker(
//   //                   //                 fromRestaurantInfo, selectedItem, fromLeftItem);
//   //                   //             Get.back();
//   //                   //           },
//   //                   //           child: Container(
//   //                   //             height: 60.w,
//   //                   //             width: 60.w,
//   //                   //             decoration: BoxDecoration(
//   //                   //               color: Colors.grey,
//   //                   //               borderRadius: BorderRadius.circular(50),
//   //                   //             ),
//   //                   //             child: Icon(
//   //                   //               Icons.camera_alt,
//   //                   //               size: 35.sp,
//   //                   //               color: Colors.grey[800],
//   //                   //             ),
//   //                   //           ),
//   //                   //         ),
//   //                   //         SizedBox(
//   //                   //           height: 10.h,
//   //                   //         ),
//   //                   //         Text(
//   //                   //           'Camera',
//   //                   //           style: TextStyle(
//   //                   //               fontSize: ScreenUtil().orientation ==
//   //                   //                   Orientation.portrait
//   //                   //                   ? 20
//   //                   //                   : 16),
//   //                   //         ),
//   //                   //       ],
//   //                   //     ),
//   //                   //     Column(
//   //                   //       children: [
//   //                   //         InkWell(
//   //                   //           onTap: () {
//   //                   //             _settingsController.pickImage(
//   //                   //               fromCamera: false,
//   //                   //               fromRestaurantInfo: fromRestaurantInfo,
//   //                   //               fromLeftItem: fromLeftItem,
//   //                   //               selectedItem: selectedItem,
//   //                   //             );
//   //                   //             Get.back();
//   //                   //           },
//   //                   //           child: Container(
//   //                   //             height: 60.w,
//   //                   //             width: 60.w,
//   //                   //             decoration: BoxDecoration(
//   //                   //               color: Colors.grey,
//   //                   //               borderRadius: BorderRadius.circular(50),
//   //                   //             ),
//   //                   //             child: Icon(
//   //                   //               Icons.photo,
//   //                   //               size: 35.sp,
//   //                   //               color: Colors.grey[800],
//   //                   //             ),
//   //                   //           ),
//   //                   //         ),
//   //                   //         SizedBox(
//   //                   //           height: 10.h,
//   //                   //         ),
//   //                   //         Text(
//   //                   //           'Gallery',
//   //                   //           style: TextStyle(
//   //                   //               fontSize: ScreenUtil().orientation ==
//   //                   //                   Orientation.portrait
//   //                   //                   ? 20
//   //                   //                   : 16),
//   //                   //         ),
//   //                   //       ],
//   //                   //     ),
//   //                   //   ],
//   //                   // ),
//   //                   ))),
//   //     ),
//   //   );
//   // }

//   static void imagePickerOptionWithReturn() {
//     Get.bottomSheet(
//       SingleChildScrollView(
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(10.0),
//             topRight: Radius.circular(10.0),
//           ),
//           child: Container(
//             color: Colors.white,
//             height: ScreenUtil().orientation == Orientation.portrait
//                 ? 200.h
//                 : AppServices.getDeviceType() == DeviceType.phone
//                     ? 500.h
//                     : 350.h,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const Text(
//                     "Pick Image From",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           InkWell(
//                             onTap: () async {
//                               // imagePickFromCamera();
//                               Get.back();
//                             },
//                             child: Container(
//                               height: 60.w,
//                               width: 60.w,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey,
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                               child: Icon(
//                                 Icons.camera_alt,
//                                 size: 35.sp,
//                                 color: Colors.grey[800],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10.h,
//                           ),
//                           Text(
//                             'Camera',
//                             style: TextStyle(
//                                 fontSize: ScreenUtil().orientation ==
//                                         Orientation.portrait
//                                     ? 20
//                                     : 16),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           InkWell(
//                             onTap: () async {
//                               imagePickFromGallery();
//                               Get.back();
//                             },
//                             child: Container(
//                               height: 60.w,
//                               width: 60.w,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey,
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                               child: Icon(
//                                 Icons.photo,
//                                 size: 35.sp,
//                                 color: Colors.grey[800],
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10.h,
//                           ),
//                           Text(
//                             'Gallery',
//                             style: TextStyle(
//                                 fontSize: ScreenUtil().orientation ==
//                                         Orientation.portrait
//                                     ? 20
//                                     : 16),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   static imagePickFromGallery() async {
//     try {
//       final image = await ImagePicker()
//           .pickImage(source: ImageSource.gallery, imageQuality: 10);
//       if (image == null) {
//         return;
//       } else {
//         final takeImage = File(image.path);
//         images = takeImage;
//       }
//     } on PlatformException catch (e) {
//       print('Failed to pick image $e');
//     }

//     // XFile? file = await ImagePicker()
//     //     .pickImage(source: ImageSource.gallery, imageQuality: 10);
//     // if (file != null) {
//     //   return file.path;
//     // } else {
//     //   return '';
//     // }
//   }

//   // static selectImageFromCamera() async {
//   //   XFile? file = await ImagePicker()
//   //       .pickImage(source: ImageSource.camera, imageQuality: 10);
//   //   if (file != null) {
//   //     return file.path;
//   //   } else {
//   //     return '';
//   //   }
//   // }

//   // static imagePickFromCamera() async {
//   //   List len = await availableCameras();
//   //   if (len.isEmpty) {
//   //     SnackMessage.showError('Your device does not support camera service');
//   //   } else {
//   //     if (image == '') {
//   //       image = await pickImageForUpload(true);
//   //     }
//   //   }
//   // }

//   // static pickImageForUpload(bool fromCamera) async {
//   //   if (fromCamera) {
//   //     if (await Permission.camera.request().isGranted) {
//   //       XFile? xFile =
//   //           (await _imagePicker.pickImage(source: ImageSource.camera));

//   //       if (xFile != null) {
//   //         imagePath = xFile.path.split('/').last;
//   //         Uint8List bytes = await xFile.readAsBytes();
//   //         uploadImageString = base64Encode(bytes);
//   //         hasImage = true;
//   //         debugPrint("ImageString$uploadImageString");
//   //       } else {
//   //         hasImage = false;
//   //         SnackMessage.showError("No Image Found");
//   //       }
//   //     } else {
//   //       SnackMessage.showWarning('Camera Permission Denied');
//   //     }
//   //   } else {
//   //     XFile? xFile = await _imagePicker.pickImage(
//   //       source: ImageSource.gallery,
//   //     );
//   //     if (xFile != null) {
//   //       imagePath = xFile.path.split('/').last;
//   //       Uint8List bytes = await xFile.readAsBytes();
//   //       uploadImageString = base64Encode(bytes);
//   //       hasImage = true;
//   //     } else {
//   //       hasImage = false;
//   //       SnackMessage.showError("No Image Found");
//   //     }
//   //   }
//   // }

//   // pickImageFromGallery() {
//   //   _settingsController.pickImageForUpload(false);
//   // }
// }

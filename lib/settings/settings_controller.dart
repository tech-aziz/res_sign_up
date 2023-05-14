import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/app_storage.dart';
import '../utils/snack_messages.dart';

class SettingsController extends GetxController{

  var hasImage = false.obs;
  var imageString = "".obs;
  var uploadImageString = ''.obs;
  var imagePath = ''.obs;

  final ImagePicker _imagePicker = ImagePicker();

  late AppStorage appStorage;



  Uint8List getImageBytes() {
    return base64Decode(imageString.value);
  }

  void pickImage({
    required bool fromCamera,
    bool fromRestaurantInfo = true,
    // var fromLeftItem,
    // var selectedItem,
  }) async {
    if (fromCamera) {
      if (await Permission.camera.request().isGranted) {
        XFile? xFile = (await _imagePicker.pickImage(
            source: ImageSource.camera, maxHeight: 512, maxWidth: 512));

        if (xFile != null) {
          Uint8List bytes = await xFile.readAsBytes();
          imageString.value = base64Encode(bytes);
          if (fromRestaurantInfo) {
            appStorage.setCompanyLogo(imageString.value);
          }
          //
          // else {
          //   if (fromLeftItem == 1) {
          //     // _setupController.updateItemImage(selectedItem.itemId, bytes);
          //   } else if (fromLeftItem == 2) {
          //     //
          //     // _setupController.updateCategoryImage(
          //     //     selectedItem.categoryId, bytes);
          //
          //   } else if (fromLeftItem == 3) {
          //     // _setupController.updateEmployeeImage(
          //     //     selectedItem.employeeId, bytes);
          //   }
          // }
          hasImage.value = true;
          debugPrint("ImageString" + imageString.value);
        } else {
          hasImage.value = false;
          SnackMessage.showError("No Image Found");
        }
      } else {
        SnackMessage.showWarning('Camera Permission Denied');
      }
    } else {
      XFile? xFile = (await _imagePicker.pickImage(
          source: ImageSource.gallery, maxHeight: 512, maxWidth: 512));

      if (xFile != null) {
        Uint8List bytes = await xFile.readAsBytes();
        imageString.value = base64Encode(bytes);
        if (fromRestaurantInfo) {
          appStorage.setCompanyLogo(imageString.value);
        }
        // else {
        //   if (fromLeftItem == 1) {
        //      _setupController.updateItemImage(selectedItem.itemId, bytes);
        //   } else if (fromLeftItem == 2) {
        //      _setupController.updateCategoryImage(
        //          selectedItem.categoryId, bytes);
        //   } else if (fromLeftItem == 3) {
        //      _setupController.updateEmployeeImage(
        //          selectedItem.employeeId, bytes);
        //   }
        // }
        hasImage.value = true;
        // debugPrint("ImageString" + imageString.value);
      } else {
        hasImage.value = false;
        SnackMessage.showError("No Image Found");
      }
    }
  }

}
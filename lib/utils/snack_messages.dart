import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackMessage {

  static void showSuccess(String message) {
    Get.snackbar(
        "Success", "",
        messageText: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2)
    );
  }

  static void showError(String message) {
    Get.snackbar(
        "Error", "",
        messageText: Text(
          message,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2)
    );
  }

  static void showWarning(String message) {
    Get.snackbar(
        "Warning", "",
        messageText: Text(
          message,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
        colorText: Colors.white,
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2)
    );
  }
}
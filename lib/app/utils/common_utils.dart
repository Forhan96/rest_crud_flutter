import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonUtil {
  static void showSnackbar({
    required bool isSuccess,
    required String message,
  }) {
    Get.snackbar(
      isSuccess ? "Success" : "Failed",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      //  dismissDirection: SnackDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}

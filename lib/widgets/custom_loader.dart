import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoader {
  // show snack bar
  static void showErrorToast(
      {String title = 'Error', String description = 'Something went wrong!'}) {
    Get.rawSnackbar(
      titleText: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      messageText: Text(
        description,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 5),
      forwardAnimationCurve: Curves.easeOutBack,
      backgroundColor: Colors.red.shade300,
      barBlur: 30,
      borderRadius: 20,
    );
  }

  static void showSuccessToast(
      {String title = 'Success', required String description}) {
    Get.rawSnackbar(
      titleText: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      messageText: Text(
        description,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 3),
      forwardAnimationCurve: Curves.easeOutBack,
      backgroundColor: Colors.black45,
      barBlur: 30,
      borderRadius: 20,
    );
  }

  static void showLoadingDialog([String? message]) {
    Get.dialog(
        Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(
                  height: 10.0,
                ),
                Text(message ?? 'Loading..'),
              ],
            ),
          ),
        ),
        barrierDismissible: true);
  }

  static void showLinearDialog([String? message]) {
    Get.dialog(
        Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LinearProgressIndicator(),
                const SizedBox(
                  height: 10.0,
                ),
                Text(message ?? 'Loading..'),
              ],
            ),
          ),
        ),
        barrierDismissible: true);
  }

  static void hideLoadingDialog() {
    if (Get.isDialogOpen == true) Get.back();
  }

  static void showInfoToast({required String description}) {
    Get.rawSnackbar(
      messageText: Text(
        description,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 2),
      forwardAnimationCurve: Curves.easeOutBack,
      backgroundColor: Colors.black45,
      barBlur: 30,
      borderRadius: 20,
    );
  }
}

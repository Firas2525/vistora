import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart'; // استيراد ملف الألوان

class Helper {
  /// دالة لإظهار Snackbar مخصصة
  static void showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      borderWidth: 1,
      borderColor: Colors.black,
      backgroundColor: AppColors.white,
      titleText: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.specialPink,
            fontWeight: FontWeight.bold,
            fontSize: Get.width * 0.04,
          ),
        ),
      ),
      messageText: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: Get.width * 0.035,
          ),
        ),
      ),
      forwardAnimationCurve: Curves.easeIn,
      backgroundGradient: const LinearGradient(colors: [Colors.black87,Colors.black87]),
      duration: const Duration(seconds: 2),
      borderRadius: 5,
      margin: EdgeInsets.only(
        top: Get.height * 0.08,
        left: Get.width * 0.05,
        right: Get.width * 0.05,
      ),
    );
  }
}

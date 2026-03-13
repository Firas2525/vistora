import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart'; // استيراد ملف الألوان

class DialogHelper {
  /// دالة لإظهار حوار تأكيد عام
  static void showConfirmationDialog({
    required String title,
    required String question,
    required VoidCallback onConfirm,
    String textCancel = "إلغاء",
    String textConfirm = "موافق",
  }) {
    Get.defaultDialog(
      title: title,
      middleText: question,
      textCancel: textCancel,
      textConfirm: textConfirm,
      confirmTextColor: AppColors.white,
      cancelTextColor: Colors.black,
      backgroundColor: AppColors.background,
      buttonColor: Colors.black,
      titleStyle: TextStyle(
        color: AppColors.specialPink,
        fontSize: Get.width * 0.05,
      ),
      middleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: Get.width * 0.04,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.02,
        vertical: Get.height * 0.02,
      ),
      titlePadding: EdgeInsets.only(top: Get.height * 0.02),
      onCancel: () {},
      onConfirm: onConfirm,
    );
  }
}

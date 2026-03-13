import 'package:clothesget/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BuildTextField.dart';

class RowButtons extends StatelessWidget {
  const RowButtons(
      {Key? key,
      required this.price,
      required this.number,
      required this.function1,
      required this.function2,
      required this.addressController,
      required this.couponController,
      required this.phoneController})
      : super(key: key);
  final num price;
  final int number;
  final Function function1;
  final Function function2;
  final TextEditingController addressController;
  final TextEditingController couponController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              _showAddOrderDialog(
                  phoneController: phoneController,
                  addressController: addressController,
                  function: function1);
            },
            child: Container(
              width: width * 0.18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: AppColors.black),
              child: Center(
                child: Text(
                  "تأكيد",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.03,
                      color: AppColors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.04,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              _showCouponDialog(
                  couponController: couponController, function: function2);
            },
            child: Container(
              //     margin: EdgeInsets.only(right: width * 0.2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.specialPink),
              child: Center(
                child: Text(
                  "اضافة كود",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.03,
                      color: AppColors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showAddOrderDialog(
      {required TextEditingController addressController,
      required TextEditingController phoneController,
      required Function function}) {
    Get.defaultDialog(
      radius: 7,
      textCancel: "تراجع",
      textConfirm: "تأكيد",
      confirmTextColor: AppColors.white,
      cancelTextColor: AppColors.black,
      buttonColor: AppColors.black,
      backgroundColor: AppColors.white,
      title: "إضافة الطلب",
      content: Column(
        children: [
          SizedBox(height: Get.height * 0.012),
          BuildTextField(
              controller: addressController, hint: "العنوان", icon: Icons.edit),
          SizedBox(height: Get.height * 0.01),
          BuildTextField(
              controller: phoneController,
              hint: "رقم الهاتف",
              icon: Icons.phone,
              isNumber: true),
          SizedBox(height: Get.height * 0.01),
        ],
      ),
      contentPadding: EdgeInsets.only(bottom: Get.height * 0.02),
      titlePadding: EdgeInsets.only(top: Get.height * 0.02),
      onCancel: () {},
      onConfirm: () {
        function();
        Get.back();
      },
    );
  }

  void _showCouponDialog(
      {required TextEditingController couponController,
      required Function function}) {
    Get.defaultDialog(
      radius: 7,
      textCancel: "تراجع",
      textConfirm: "إضافة",
      confirmTextColor: AppColors.white,
      cancelTextColor: AppColors.black,
      buttonColor: AppColors.black,
      backgroundColor: AppColors.white,
      title: "إضافة كود",
      content: BuildTextField(
          controller: couponController, hint: "كود الخصم", icon: Icons.edit),
      contentPadding: EdgeInsets.only(bottom: Get.height * 0.02),
      titlePadding: EdgeInsets.only(top: Get.height * 0.02),
      onCancel: () {},
      onConfirm: () {
        function();
        Get.back();
      },
    );
  }
}

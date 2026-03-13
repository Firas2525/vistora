import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'CartBillContains.dart';

class CartBill extends StatelessWidget {
  const CartBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.34,
      decoration: BoxDecoration(
          color:  AppColors.background,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(50), topLeft: Radius.circular(50))),
      margin: EdgeInsets.only(top: height * 0.58),
      child: const CartBillContains(),
    );
  }
}

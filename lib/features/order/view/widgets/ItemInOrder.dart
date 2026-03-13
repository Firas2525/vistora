
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/order_model.dart';
import 'BuildBottomSheet.dart';
import 'ItemContains.dart';

class ItemInOrder extends StatelessWidget {
  const ItemInOrder({Key? key, required this.order}) : super(key: key);
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Get.bottomSheet( BuildBottomSheet(order: order,)
          );
      },
      child: Container(
        height: height * 0.14,
        padding: EdgeInsets.only(bottom: height * 0.015),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1, color: Colors.black))),
        margin: EdgeInsets.symmetric(
            vertical: height * 0.01, horizontal: width * 0.04),
        child: ItemContains(
          order: order,
        ),
      ),
    );
  }
}





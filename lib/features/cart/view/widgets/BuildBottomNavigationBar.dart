import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../account/view/account.dart';
import '../../../order/view/order.dart';
import 'BuildNavItem.dart';

class BuildBottomNavigationBar extends StatelessWidget {
  const BuildBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      height: 50,
      child: Row(
        children: [
          BuildNavItem(title: "المتجر", onTap: () => Get.back(), width: width),
          BuildNavItem(
              title: "الطلبات",
              onTap: () => Get.off(() => Order()),
              width: width),
          BuildNavItem(
              title: "السلة", onTap: () {}, width: width, isSelected: true),
          BuildNavItem(
              title: "الحساب",
              onTap: () => Get.off(
                    () => const Account(),
                  ),
              width: width),
        ],
      ),
    );
  }
}

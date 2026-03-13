import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../cart/view/cart.dart';
import '../../../home/controller/home_controller.dart';
import '../../../home/repository/home_repository.dart';
import '../../../home/services/home_service.dart';
import '../../../order/view/order.dart';
import 'BuildNavItem.dart';

class BuildBottomNavigationBar extends StatelessWidget {
   BuildBottomNavigationBar({Key? key}) : super(key: key);
   final controller = Get.put(HomeController(homeRepository: HomeRepository(homeService: HomeService())));
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
              title: "السلة",   onTap: () => Get.off(
                () => const Cart(),
            arguments: {"cartProducts": controller.cartProducts},
          ), width: width),
          BuildNavItem(
              title: "الحساب",
              onTap: () {},
              width: width, isSelected: true),
        ],
      ),
    );
  }
}

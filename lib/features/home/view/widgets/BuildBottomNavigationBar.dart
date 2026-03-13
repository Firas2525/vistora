import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../account/view/account.dart';
import '../../../cart/view/cart.dart';
import '../../../order/view/order.dart';
import '../../controller/home_controller.dart';
import '../../repository/home_repository.dart';
import '../../services/home_service.dart';
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
          BuildNavItem(
              title: "المتجر", onTap: () {}, width: width, isSelected: true),
          BuildNavItem(
              title: "الطلبات",
              onTap: () => Get.to(() => Order()),
              width: width),
          BuildNavItem(
              title: "السلة",
              onTap: () => Get.to(
                    () => const Cart(),
                    arguments: {"cartProducts": controller.cartProducts},

                  ),
              width: width),
          BuildNavItem(
              title: "الحساب",
              onTap: () => Get.to(
                    () => Account(),
                  ),
              width: width),
        ],
      ),
    );
  }
}

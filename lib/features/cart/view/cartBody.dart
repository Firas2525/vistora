import 'package:clothesget/features/cart/view/widgets/CartListView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/empty_page.dart';
import '../controller/cart_controller.dart';
import 'widgets/cartBill.dart';

class CartBody extends StatefulWidget {
  const CartBody({Key? key, required this.height, required this.width}) : super(key: key);
 final double height;
  final double width;
  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return controller.cartProducts.isEmpty
          ? const EmptyPage(content: "السلة فارغة الأن")
          : ListView(
              children: [
                Stack(
                  children: [
                    CartListView(
                        cartProducts: controller.cartProducts,
                        function: controller.removeProduct),
                     const CartBill(),
                  ],
                ),
              ],
            );
    });
  }
}



import 'package:clothesget/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../controller/cart_controller.dart';
import 'CartBillContainsColumn.dart';

class CartBillContains extends StatelessWidget {
  const CartBillContains({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<CartController>(builder: (controller) {
      return controller.isLoading
          ? const LoadingWidget()
          : Row(
              children: [
                Expanded(flex: 2, child: Container()),
                Expanded(
                    flex: 6,
                    child: CartBillContainsColumn(
                      price: controller.totalPrice,
                      number: controller.couponDiscount,
                      function1: controller.orderProducts,
                      addressController: controller.userAddress,
                      phoneController: controller.userPhone,
                      couponController: controller.userCoupon,
                      function2: controller.addCoupon,
                    )),
                Expanded(flex: 1, child: Container()),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Icon(
                            Icons.shopping_cart,
                            size: width * 0.22,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(),
                        ),
                      ],
                    )),
                Expanded(flex: 2, child: Container()),
              ],
            );
    });
  }
}

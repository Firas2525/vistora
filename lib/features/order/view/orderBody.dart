import 'package:clothesget/core/widgets/loading_widget.dart';
import 'package:clothesget/features/order/repository/order_repository.dart';
import 'package:clothesget/features/order/services/order_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/empty_page.dart';
import '../../order/view/widgets/ElementsListView.dart';
import '../controller/order_controller.dart';

class OrderBody extends StatefulWidget {
  const OrderBody({Key? key}) : super(key: key);

  @override
  State<OrderBody> createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  final controller = Get.put(OrderController(orderRepository: OrderRepository(orderService: OrderService())));

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<OrderController>(builder: (controller) {
      return controller.isLoading
          ? const LoadingWidget()
          : controller.orders.isEmpty
              ? const EmptyPage(content: "لا يوجد طلبات")
              : ListView(
                  children: [
                    SizedBox(height: height * 0.01),
                    SizedBox(
                        height: height * 0.78,
                        child: ElementsListView(orders: controller.orders))
                  ],
                );
    });
  }
}

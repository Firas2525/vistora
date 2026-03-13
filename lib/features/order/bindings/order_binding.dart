import 'package:get/get.dart';

import '../controller/order_controller.dart';
import '../repository/order_repository.dart';
import '../services/order_service.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderService());
    Get.lazyPut(() => OrderRepository(orderService: Get.find()));
    Get.lazyPut(() => OrderController(orderRepository: Get.find()));
  }
}

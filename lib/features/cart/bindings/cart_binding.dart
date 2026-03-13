import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../repository/cart_repository.dart';
import '../services/cart_service.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    // تسجيل الخدمات والمستودعات في GetX
    Get.lazyPut<CartService>(() => CartService());
    Get.lazyPut<CartRepository>(() => CartRepository());
    Get.lazyPut<CartController>(() => CartController());
  }
}

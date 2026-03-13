import 'package:get/get.dart';
import '../../../core/utils/helpers.dart';
import '../../../core/utils/shared_prefs_helper.dart';
import '../../login/view/login.dart';
import '../model/order_model.dart';
import '../repository/order_repository.dart';

class OrderController extends GetxController {
  final OrderRepository orderRepository;

  OrderController({required this.orderRepository});

  bool isLoading = false;
  List<OrderModel> orders = [];

  Future<void> getOrders() async {
    isLoading = true;
    update();

    final token = SharedPrefsHelper.getString("token");
    orders = await orderRepository.getOrders();

    if (orders.isEmpty) {
      if (token == null) {
        Helper.showSnackbar("المعذرة", "يجب أن تقوم بتسجيل الدخول");
        Get.offAll(() => const Login());
      } else {
        Helper.showSnackbar("الطلبات", "حدث خطأ .. حاول من جديد");
      }
    }

    isLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }
}

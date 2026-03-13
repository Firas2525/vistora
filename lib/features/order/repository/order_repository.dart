import '../model/order_model.dart';
import '../services/order_service.dart';

class OrderRepository {
  final OrderService orderService;

  OrderRepository({required this.orderService});

  Future<List<OrderModel>> getOrders() async {
    final data = await orderService.fetchOrders();
    if (data != null) {
      return data.map((order) => OrderModel.fromJson(order)).toList();
    }
    return [];
  }
}

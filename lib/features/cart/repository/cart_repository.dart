import 'dart:convert';
import '../services/cart_service.dart';

class CartRepository {
  Future<bool> orderProducts(List<int> productIds, String address, String phone, {String? coupon}) async {
    var requestBody = {
      "productIds": productIds,
      "note": address,
      "phone": phone,
    };

    if (coupon != null && coupon.isNotEmpty) {
      requestBody["coupon"] = coupon;
    }

    var response = await CartService.orderProducts(requestBody);
    var responseData = jsonDecode(await response.stream.bytesToString());

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(responseData['error'] ?? "حدث خطأ غير متوقع");
    }
  }

  Future<int> applyCoupon(String coupon) async {
    var response = await CartService.applyCoupon(coupon);
    var data = jsonDecode(await response.stream.bytesToString());

    if (response.statusCode == 200) {
      return data['result']['discount'];
    } else {
      throw Exception(data['error'] ?? "الكود غير صالح أو منتهي الصلاحية");
    }
  }
}

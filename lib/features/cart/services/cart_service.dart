import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../core/constants/app_config.dart';
import '../../../core/utils/network_utils.dart';
import '../../../core/utils/shared_prefs_helper.dart';

class CartService {

  static Future<http.StreamedResponse> orderProducts(Map<String, dynamic> requestBody) async {
    var headers = NetworkUtils.getAuthHeaders();
    var request = http.Request('POST', Uri.parse('${AppConfig.baseUrl}/orders'));
    request.body = json.encode(requestBody);
    request.headers.addAll(headers);

    return await request.send();
  }

  static Future<http.StreamedResponse> applyCoupon(String coupon) async {
    var token = SharedPrefsHelper.getString("token");
    var headers = NetworkUtils.getAuthHeaders();

    var request = http.Request('POST', Uri.parse('${AppConfig.baseUrl}/coupons'));
    request.body = json.encode({"coupon": coupon});
    request.headers.addAll(headers);

    return await request.send();
  }


}

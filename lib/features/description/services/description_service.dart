import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/constants/app_config.dart';
import '../../../core/utils/network_utils.dart';

class DescriptionService {
  final String baseurl = '${AppConfig.baseUrl}/products';

  Future<Map<String, dynamic>> fetchProductDetails(int productId) async {
    try {
      var headers = NetworkUtils.getBaseHeaders();
      var response = await http.get(Uri.parse('$baseurl/$productId'), headers: headers);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("حدث خطأ أثناء جلب البيانات.");
      }
    } catch (e) {
      throw Exception("خطأ: $e");
    }
  }
}

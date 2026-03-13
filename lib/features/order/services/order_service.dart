import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/constants/app_config.dart';
import '../../../core/utils/network_utils.dart';
import '../../../core/utils/shared_prefs_helper.dart';

class OrderService {
  Future<List<Map<String, dynamic>>?> fetchOrders() async {
    try {
      var headers = NetworkUtils.getAuthHeaders();

      final response = await http.get(Uri.parse('${AppConfig.baseUrl}/orders'), headers: headers);

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(body['result']);
      }
    } catch (e) {
      print("Error fetching orders: $e");
    }
    return null;
  }
}

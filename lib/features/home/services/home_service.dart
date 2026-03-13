import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/constants/app_config.dart';
import '../../../core/utils/network_utils.dart';
class HomeService {
  Future<Map<String, dynamic>?> fetchData(String endpoint) async {
    try {
      var headers = NetworkUtils.getBaseHeaders();
      final response = await http.get(Uri.parse('${AppConfig.baseUrl}/$endpoint'), headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("Error fetching $endpoint: $e");
    }
    return null;
  }
}

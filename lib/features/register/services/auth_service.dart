import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/constants/app_config.dart';
import '../../../core/utils/network_utils.dart';

class AuthService {
  Future<Map<String, dynamic>?> postRequest(
      String endpoint, Map<String, dynamic> body) async {
    try {
      var headers = NetworkUtils.getBaseHeaders();

      var response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/$endpoint'),
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        return {"error": jsonDecode(response.body)['error']};
      }
    } catch (e) {
      print("AuthService Error: $e");
      return null;
    }
  }
}

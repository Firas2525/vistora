import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/constants/app_config.dart';
import '../../../core/utils/network_utils.dart';

class AuthService {
  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      var headers = NetworkUtils.getBaseHeaders();

      var response = await http.post(
        Uri.parse('${AppConfig.baseUrl}/auth/login'),
        headers: headers,
        body: json.encode({"email": email, "password": password}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("Error during login: $e");
      return null;
    }
  }
}

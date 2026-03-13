import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/constants/app_config.dart';
import '../../../core/utils/network_utils.dart';
import '../../../core/utils/shared_prefs_helper.dart';

class NotificationService {
  Future<List<Map<String, dynamic>>?> fetchNotifications() async {
    try {
      var headers = NetworkUtils.getAuthHeaders();
      final response =
      await http.get(Uri.parse('${AppConfig.baseUrl}/notifications'), headers: headers);

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        if (body['notifications'] is List) {
          return List<Map<String, dynamic>>.from(body['notifications']);
        }
      }
    } catch (e) {
      print("Error fetching notifications: $e");
    }
    return null;
  }
}

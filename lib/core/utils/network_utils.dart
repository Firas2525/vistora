import 'package:clothesget/core/utils/shared_prefs_helper.dart';

class NetworkUtils {
  static const String _apiKey = 'ADFRETYUUBFD!#@%*%4455iup!98SCZ@';
  static const String _appVersion = '1.0.0';

  /// إرجاع الهيدرز الأساسي
  static Map<String, String> getBaseHeaders() {
    return {
      'Content-Type': 'application/json',
      'x-api-key': _apiKey,
      'app-version': _appVersion,
    };
  }

  /// إرجاع الهيدرز مع التوكن عند الحاجة
  static Map<String, String> getAuthHeaders() {
    final headers = getBaseHeaders();
    final token = SharedPrefsHelper.getString("token");
    headers['Authorization'] = 'Bearer $token';
    return headers;
  }
}

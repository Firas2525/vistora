import 'package:flutter_dotenv/flutter_dotenv.dart';
class AppConfig {
  static const String appName = "Vistora";


  //static String get baseUrl => dotenv.env['BASE_URL'] ?? '';

  // رابط الـ API الثابت
  static const String baseUrl = 'https://clothes-api.progrhyming.com/clothes/api/v0'; // الرابط الثابت

  static const String defaultLanguage = "ar"; // اللغة الافتراضية
}

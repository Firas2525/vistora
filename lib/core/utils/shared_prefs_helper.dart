import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _prefs;

  /// تهيئة SharedPreferences (يجب استدعاؤها مرة واحدة عند بدء التطبيق)
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// حفظ قيمة `String`
  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  /// جلب قيمة `String`
  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  /// حفظ قيمة `bool`
  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  /// جلب قيمة `bool`
  static bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  /// حفظ قيمة `int`
  static Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  /// جلب قيمة `int`
  static int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  /// حفظ قيمة `double`
  static Future<void> setDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  /// جلب قيمة `double`
  static double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  /// حفظ قيمة `List<String>`
  static Future<void> setStringList(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
  }

  /// جلب قيمة `List<String>`
  static List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }

  /// حذف قيمة معينة
  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  /// مسح كل البيانات المخزنة
  static Future<void> clear() async {
    await _prefs?.clear();
  }
}

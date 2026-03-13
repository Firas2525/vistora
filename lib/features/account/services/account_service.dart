import '../../../core/utils/shared_prefs_helper.dart';


class AccountService {
  /// **جلب التوكن من التخزين المحلي**
  String? getToken() {

    return SharedPrefsHelper.getString("token");
  }

  /// **جلب اسم المستخدم من التخزين المحلي**
  String getUserName() {
    return SharedPrefsHelper.getString("user_name")?? '';
  }

  /// **جلب البريد الإلكتروني من التخزين المحلي**
  String getEmail() {
    return SharedPrefsHelper.getString("email") ?? '';
  }

  /// **جلب رقم الهاتف من التخزين المحلي**
  String getPhone() {
    return SharedPrefsHelper.getString("phone") ?? '';
  }
}

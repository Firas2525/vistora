import '../services/account_service.dart';

class AccountRepository {
  final AccountService _service = AccountService();

  /// **جلب معلومات المستخدم**
  Future<Map<String, String>?> getUserInformation() async {
    String? token = _service.getToken();

    if (token == null) {
      return null; // المستخدم غير مسجل دخول
    }

    return {
      "userName": _service.getUserName(),
      "email": _service.getEmail(),
      "phone": _service.getPhone(),
    };
  }
}

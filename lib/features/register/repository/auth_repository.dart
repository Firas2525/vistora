import '../services/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future<Map<String, dynamic>?> register(
      String email, String userName, String password, String phone) {
    return authService.postRequest("auth/register", {
      "email": email,
      "user_name": userName,
      "password": password,
      "phone": phone,
    });
  }
}

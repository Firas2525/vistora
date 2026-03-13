

import '../../login/services/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future<Map<String, dynamic>?> login(String email, String password) async {
    return await authService.login(email, password);
  }
}

import 'package:get/get.dart';
import '../../login/services/auth_service.dart';
import '../controller/login_controller.dart';
import '../repository/auth_repository.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<AuthRepository>(() => AuthRepository(authService: Get.find()));
    Get.lazyPut<LoginController>(() => LoginController(authRepository: Get.find()));
  }
}

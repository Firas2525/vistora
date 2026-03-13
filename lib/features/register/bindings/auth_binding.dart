import 'package:get/get.dart';
import '../../register/repository/auth_repository.dart';
import '../controller/register_controller.dart';
import '../services/auth_service.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<AuthRepository>(() => AuthRepository(authService: Get.find()));
    Get.lazyPut<RegisterController>(() => RegisterController(authRepository: Get.find()));
  }
}

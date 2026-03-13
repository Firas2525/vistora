import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../repository/home_repository.dart';
import '../services/home_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeService());
    Get.lazyPut(() => HomeRepository(homeService: Get.find()));
    Get.lazyPut(() => HomeController(homeRepository: Get.find()));
  }
}

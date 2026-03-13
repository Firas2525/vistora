import 'package:get/get.dart';
import '../controller/description_controller.dart';
import '../repository/description_repository.dart';
import '../services/description_service.dart';

class DescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DescriptionService>(() => DescriptionService());
    Get.lazyPut<DescriptionRepository>(() => DescriptionRepository());
    Get.lazyPut<DescriptionController>(() => DescriptionController());
  }
}

import 'package:get/get.dart';

import '../controller/notification_controller.dart';
import '../repository/notification_repository.dart';
import '../services/notification_service.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationService());
    Get.lazyPut(() => NotificationRepository(notificationService: Get.find()));
    Get.lazyPut(() => NotificationController(notificationRepository: Get.find()));
  }
}

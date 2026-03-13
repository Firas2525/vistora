import 'package:get/get.dart';
import '../../../core/utils/helpers.dart';
import '../model/notification_model.dart';
import '../repository/notification_repository.dart';

class NotificationController extends GetxController {
  final NotificationRepository notificationRepository;

  NotificationController({required this.notificationRepository});

  bool isLoading = false;
  List<NotificationModel> notifications = [];

  Future<void> getNotifications() async {
    isLoading = true;
    update();

    notifications = await notificationRepository.getNotifications();
    if (notifications.isEmpty) {
      Helper.showSnackbar("الإشعارات", "حدث خطأ .. حاول من جديد");
    }

    isLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getNotifications();
  }
}

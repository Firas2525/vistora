import '../model/notification_model.dart';
import '../services/notification_service.dart';

class NotificationRepository {
  final NotificationService notificationService;

  NotificationRepository({required this.notificationService});

  Future<List<NotificationModel>> getNotifications() async {
    final data = await notificationService.fetchNotifications();
    if (data != null) {
      return data.map((notif) => NotificationModel.fromJson(notif)).toList();
    }
    return [];
  }
}

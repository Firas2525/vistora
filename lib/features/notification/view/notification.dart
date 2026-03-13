import 'package:clothesget/core/widgets/loading_widget.dart';
import 'package:clothesget/features/notification/repository/notification_repository.dart';
import 'package:clothesget/features/notification/services/notification_service.dart';
import 'package:clothesget/features/notification/view/widgets/NotificationListView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../controller/notification_controller.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({Key? key}) : super(key: key);
  final controller = Get.put(NotificationController(notificationRepository: NotificationRepository(notificationService: NotificationService())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            )),
        title: const Text(
          "الاشعارات",
          style: TextStyle(color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
          child: GetBuilder<NotificationController>(builder: (controller) {
        return controller.isLoading
            ? const LoadingWidget()
            : const NotificationListView();
      })),
    );
  }
}

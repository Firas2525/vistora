import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/notification_controller.dart';
import 'NotificationListViewContent.dart';
class NotificationListView extends StatelessWidget {
  const NotificationListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<NotificationController>(builder: (controller) {
      return ListView.builder(
        padding: EdgeInsets.only(bottom: height * 0.01, top: height * 0.005),
        itemCount: controller.notifications.length,
        itemBuilder: (context, index) {
          return Container(
            height: height * 0.14,
            padding: EdgeInsets.only(bottom: height * 0.015),
            decoration: const BoxDecoration(
                border:
                Border(bottom: BorderSide(width: 1, color: Colors.black))),
            margin: EdgeInsets.symmetric(
                vertical: height * 0.01, horizontal: width * 0.04),
            child: NotificationListViewContent(
              index: index,
            ),
          );
        },
      );
    });
  }
}
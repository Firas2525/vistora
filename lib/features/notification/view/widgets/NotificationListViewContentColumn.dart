import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../controller/notification_controller.dart';

class NotificationListViewContentColumn extends StatelessWidget {
  const NotificationListViewContentColumn({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<NotificationController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: Container()),
          Expanded(
            flex: 4,
            child: Text(
              controller.notifications[index].title,
              style: TextStyle(
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              controller.notifications[index].content,
              style: TextStyle(
                  fontSize: width * 0.025, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              controller.notifications[index].date,
              style: TextStyle(
                  fontSize: width * 0.035,
                  color: AppColors.specialPink,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      );
    });
  }
}

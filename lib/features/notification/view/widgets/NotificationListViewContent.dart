
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/notification_controller.dart';
import 'NotificationListViewContentColumn.dart';

class NotificationListViewContent extends StatelessWidget {
  const NotificationListViewContent({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (controller) {
      return Row(
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: const AssetImage("assets/images/logo.png"),
                onError: (exception, stackTrace) {},
              )),
            ),
          ),
          Expanded(flex: 1, child: Container()),
          Expanded(
              flex: 14,
              child: NotificationListViewContentColumn(
                index: index,
              ))
        ],
      );
    });
  }
}

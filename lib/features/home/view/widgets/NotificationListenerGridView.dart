import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/empty_page.dart';
import '../../controller/home_controller.dart';
import 'ClothesGridView.dart';

class NotificationListenerGridView extends StatelessWidget {
  const NotificationListenerGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<HomeController>(builder: (controller) {
      return SizedBox(
          height: controller.results.isEmpty ? height * 0.2 : height * 1,
          child: NotificationListener(
              onNotification: (t) {
                try {
                  if (t is ScrollEndNotification) {
                    if (controller.myScrollClothes.position.pixels == 0 &&
                        controller.scrollClothing) {
                      controller.changeScroll();
                    }
                  }
                } catch (e) {
                  if (kDebugMode) {
                    print(e);
                  }
                }
                return true;
              },
              child: controller.results.isEmpty
                  ? const EmptyPage(content: "لا يوجد منتجات")
                  : const ClothesGridView()));
    });
  }
}

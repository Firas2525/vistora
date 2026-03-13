import 'package:clothesget/core/widgets/loading_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../controller/home_controller.dart';
import 'AdressSomething.dart';
import 'BottomSheetGridViewCategoties.dart';
import 'CustomCategories.dart';
import 'MyBottomSheet.dart';
import 'NotificationListenerGridView.dart';
import 'PageViewAds.dart';

class NotificationListenerPage extends StatelessWidget {
  NotificationListenerPage({Key? key}) : super(key: key);
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<HomeController>(builder: (controller) {
      return NotificationListener(
        onNotification: (t) {
          try {
            if (t is ScrollEndNotification) {
              if (controller.myScroll.position.pixels > int.parse("500") &&
                  !controller.scrollClothing) {
                if (kDebugMode) {
                  print("1111111111111111111111111111111111");
                }
                controller.changeScroll();
                // controller.totalPages!=controller.page? controller.get_messages():null;
              }
            }
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
          return true;
        },
        child: SmartRefresher(
          controller: _refreshController,
          onRefresh: () {
            controller.getResults();
            controller.getTags();
            _refreshController.refreshCompleted();
          },
          child: ListView(
            physics: !controller.scrollClothing
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            controller: controller.myScroll,
            children: [
              PageViewAds(
                adds: controller.adds,
                pageViewController: controller.addsController,
              ),
              SizedBox(height: height * 0.03),
              AddressSomeThing(
                  address: 'الأقسام',
                  function: () {
                    Get.bottomSheet(const MyBottomSheet(
                      gridview: BottomSheetGridViewCategories(),
                      title: 'All Categories',
                    ));
                  }),
              SizedBox(height: height * 0.02),
              CustomCategories(
                categories: controller.categories,
                function: controller.changeSelectedCategories,
              ),
              SizedBox(height: height * 0.01),
              AddressSomeThing(
                  address: 'المنتجات',
                  function: () {
                    controller.myScroll.animateTo(600,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear);
                  }),
              SizedBox(height: height * 0.02),
              controller.resultsIsLoading
                  ? const LoadingWidget()
                  : const NotificationListenerGridView()
            ],
          ),
        ),
      );
    });
  }
}

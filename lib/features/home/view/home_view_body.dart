import 'package:clothesget/core/widgets/loading_widget.dart';
import 'package:clothesget/features/home/services/home_service.dart';
import 'package:clothesget/features/home/view/widgets/BuildSearch.dart';
import 'package:clothesget/features/home/view/widgets/NotificationListenerPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../repository/home_repository.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  final controller = Get.put(HomeController(homeRepository: HomeRepository(homeService: HomeService())));


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.isLoading
          ? const LoadingWidget()
          : Stack(
              children: [NotificationListenerPage(), const BuildSearch()],
            );
    });
  }
}

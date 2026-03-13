import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../home/repository/home_repository.dart';
import '../../home/services/home_service.dart';
import '../../order/view/widgets/BuildBottomNavigationBar.dart';
import '../../home/controller/home_controller.dart';
import 'orderBody.dart';

class Order extends StatelessWidget {
  Order({Key? key}) : super(key: key);

  final controller = Get.put(HomeController(homeRepository: HomeRepository(homeService: HomeService())));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color:  AppColors.white,
            )),
        title: const Text(
          "الطلبات",
          style: TextStyle(color:  AppColors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const OrderBody(),
          Positioned(
            bottom: size.height * 0.025,
            left: size.width * 0.07,
            right: size.width * 0.07,
            child: MediaQuery.of(context).viewInsets.bottom > 0
                ? Container()
                : BuildBottomNavigationBar(),
          ),
        ],
      ),
    );
  }
}

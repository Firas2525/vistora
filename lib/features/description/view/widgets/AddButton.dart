import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../home/controller/home_controller.dart';
import '../../../home/model/home_model.dart';
import '../../../home/repository/home_repository.dart';
import '../../../home/services/home_service.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key, required this.result}) : super(key: key);
  final ResultModel result;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController(homeRepository: HomeRepository(homeService: HomeService())));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.25),
      child: InkWell(
        onTap: () {
          controller.addToCart(result);
        },
        child: Container(
          height: height * 0.05,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.black),
          child: Center(
              child: Text(
            "إضافة إلى السلة",
            style: TextStyle(
                fontSize: width * 0.03,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          )),
        ),
      ),
    );
  }
}

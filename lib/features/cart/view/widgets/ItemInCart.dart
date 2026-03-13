import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../home/controller/home_controller.dart';
import '../../../home/model/home_model.dart';
import '../../../home/repository/home_repository.dart';
import '../../../home/services/home_service.dart';
import 'ItemContains.dart';

class ItemInCart extends StatelessWidget {
   ItemInCart({Key? key, required this.result, required this.function})
      : super(key: key);
  final ResultModel result;
  final Function function;

  final controller = Get.put(HomeController(homeRepository: HomeRepository(homeService: HomeService())));
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.14,
      padding: EdgeInsets.only(bottom: height * 0.015),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: AppColors.specialBlue))),
      margin: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.04),
      child: Stack(
        children: [
          Container(
              margin:
                  EdgeInsets.only(top: height * 0.02, left: width * 0.03),
              alignment: Alignment.topLeft,
              child: InkWell( onTap: () {
                function(result);
                controller.removeFromCart(result);
              },
                child: Icon(Icons.close_outlined,
                    color: AppColors.specialPink, size: width * 0.06),
              )),
          ItemContains(
            result: result,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../controller/home_controller.dart';
import 'BottomSheetGridViewCategoriesItem.dart';

class BottomSheetGridViewCategories extends StatelessWidget {
  const BottomSheetGridViewCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        color: AppColors.background,
        child: GridView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.02),
            itemCount: controller.categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 0,
                crossAxisSpacing: 10,
                crossAxisCount: 4,
                childAspectRatio: 0.7),
            itemBuilder: (context, index) => BottomSheetGridViewCategoriesItem(index: index,)),
      );
    });
  }
}

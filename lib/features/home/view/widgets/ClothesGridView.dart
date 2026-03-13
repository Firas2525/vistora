import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import 'ClothesGridViewItem.dart';

class ClothesGridView extends StatelessWidget {
  const ClothesGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(builder: (controller) {
      return GridView.builder(
        controller: controller.myScrollClothes,
        physics: controller.scrollClothing
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
            left: width * 0.03, right: width * 0.03, bottom: height * 0.12),
        itemCount: controller.results.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ClothesGridViewItem(
            index: index,
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 20,
            childAspectRatio: 0.55),
      );
    });
  }
}

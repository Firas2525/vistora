import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../description/view/description.dart';
import '../../controller/home_controller.dart';
import 'ClothesGridViewItemDetails.dart';
import 'ClothesGridViewItemImage.dart';

class ClothesGridViewItem extends StatelessWidget {
  const ClothesGridViewItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return InkWell(
        onTap: () {
          Get.to(
              () => Description(
                    result: controller.results[index],
                  ),
              arguments: {"productId": controller.results[index].id});
        },
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: ClothesGridViewItemImage(
                image: controller.results[index].image,
              ),
            ),
            Expanded(
              flex: 2,
              child: ClothesGridViewItemDetails(
                index: index,
              ),
            ),
          ],
        ),
      );
    });
  }
}

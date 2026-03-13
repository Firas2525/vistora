import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../controller/home_controller.dart';

class BottomSheetGridViewCategoriesItem extends StatelessWidget {
  const BottomSheetGridViewCategoriesItem({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(builder: (controller) {
      return InkWell(
        onTap: () {
          controller.changeSelectedCategories(controller.categories[index]);
        },
        child: Column(
          children: [
            Expanded(
              flex: 45,
              child: Container(
                margin: controller.categories[index].selected
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.all(1),
                padding: EdgeInsets.all(height * 0.01),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: controller.categories[index].selected ? 2 : 1,
                      color: controller.categories[index].selected
                          ? AppColors.specialPink
                          : AppColors.black),
                  color: Colors.grey.shade200,
                ),
                child: Container(
                  width: height * 0.05,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(controller.categories[index].image),
                        onError: (exception, stackTrace) {},
                      )),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: height * 0.01,
              ),
            ),
            Expanded(
              flex: 15,
              child: Text(
                controller.categories[index].name,
                style: TextStyle(
                    fontSize: width * 0.025, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );
    });
  }
}

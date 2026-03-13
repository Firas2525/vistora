import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../controller/home_controller.dart';

class ClothesGridViewItemDetails extends StatelessWidget {
  const ClothesGridViewItemDetails({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: AppColors.black12, offset: Offset(3, 3), blurRadius: 3)
          ],
        ),
        padding: EdgeInsets.only(
            top: height * 0.013, left: width * 0.02, right: width * 0.02),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin:
                    EdgeInsets.only(left: width * 0.01, bottom: height * 0.01),
                child: InkWell(
                  onTap: () {
                    controller.addToCart(controller.results[index]);
                  },
                  child: Icon(
                    Icons.add_shopping_cart,
                    size: width * 0.052,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(right: width * 0.04),
                    child: Text(
                      controller.results[index].name,
                      style: TextStyle(
                          fontSize: width * 0.022,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(right: width * 0.04),
                    child: Text(
                      textDirection: TextDirection.rtl,
                      "${controller.results[index].price}  ل.س ",
                      style: TextStyle(
                          fontSize: width * 0.022,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container())
              ]),
            ),
          ],
        ),
      );
    });
  }
}

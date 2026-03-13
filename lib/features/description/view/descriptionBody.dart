import 'package:clothesget/core/widgets/loading_widget.dart';
import 'package:clothesget/features/description/view/widgets/AddButton.dart';
import 'package:clothesget/features/description/view/widgets/AddressText.dart';
import 'package:clothesget/features/description/view/widgets/PageViewImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/model/home_model.dart';
import '../controller/description_controller.dart';

class DescriptionBody extends StatefulWidget {
  const DescriptionBody({Key? key, required this.result}) : super(key: key);
  final ResultModel result;

  @override
  State<DescriptionBody> createState() => _DescriptionBodyState();
}

class _DescriptionBodyState extends State<DescriptionBody> {
  final controller = Get.put(DescriptionController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<DescriptionController>(builder: (controller) {
      return controller.isLoading
          ? const LoadingWidget()
          : ListView(
              children: [
                PageViewImages(
                        images: controller.item!.images,
                        controller: controller.imageController),
                SizedBox(height: height * 0.04),
                AddressText(
                  text1: '${controller.item?.name}',
                  text2: '${controller.item?.price}',
                ),
                SizedBox(height: height * 0.02),
                Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    child: Text(
                      controller.item!.description,
                      style: TextStyle(fontSize: width * 0.035),
                    )),
                SizedBox(height: height * 0.04),
                AddButton(result: widget.result),
                SizedBox(height: height * 0.04),
              ],
            );
    });
  }
}

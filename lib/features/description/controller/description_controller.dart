import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/helpers.dart';
import '../model/description_model.dart';
import '../../home/model/home_model.dart';
import '../repository/description_repository.dart';

class DescriptionController extends GetxController {
  final DescriptionRepository _repository = DescriptionRepository();

  bool isLoading = false;
  late int productId;
  DescriptionModel? item;
  late ResultModel result;
  PageController imageController = PageController();
  bool showDetails = false;

  void changeShowDetails() {
    showDetails = !showDetails;
    update();
  }

  Future<void> getItem() async {
    isLoading = true;
    update();

    try {
      item = await _repository.getProductDetails(productId);
      result = ResultModel(
        id: item!.id,
        name: item!.name,
        description: item!.description,
        discount: item!.discount,
        price: item!.price,
        available: item!.available,
        image: item!.images.first,
      );
    } catch (e) {
      Helper.showSnackbar("وصف المنتج", "حدث خطأ حاول من جديد");
    } finally {
      isLoading = false;
      update();
    }

    try {
      Timer.periodic(const Duration(seconds: 3), (timer) {
        if (imageController.hasClients) {
          if (imageController.page! < item!.images.length - 1) {
            imageController.nextPage(duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
          } else {
            imageController.animateToPage(0, duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    imageController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    productId = Get.arguments['productId'];
    getItem();
  }
}

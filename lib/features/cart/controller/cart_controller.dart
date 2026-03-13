import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/helpers.dart';
import '../../home/model/home_model.dart';
import '../repository/cart_repository.dart';

class CartController extends GetxController {
  bool isLoading = false;
  List<ResultModel> cartProducts = [];
  List<int> cartProductsIds = [];

  TextEditingController userAddress = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCoupon = TextEditingController();

  num totalPrice = 0;
  int totalNumber = 0;
  int couponDiscount = 0;

  final CartRepository _cartRepository = CartRepository();

  /// استدعاء طلب المنتجات من الريبو
  Future<void> orderProducts() async {
    isLoading = true;
    update();

    try {
      bool success = await _cartRepository.orderProducts(
          cartProductsIds,
          userAddress.text,
          userPhone.text,
          coupon: userCoupon.text.isEmpty ? null : userCoupon.text
      );

      if (success) {
        cartProducts.clear();
        cartProductsIds.clear();
        userPhone.clear();
        userAddress.clear();
        Helper.showSnackbar("إنشاء طلب", "تم الطلب بنجاح");
      }
    } catch (e) {
      Helper.showSnackbar("إنشاء طلب", e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  /// إضافة كود الخصم
  Future<void> addCoupon() async {
    isLoading = true;
    update();

    try {
      couponDiscount = await _cartRepository.applyCoupon(userCoupon.text);
      Helper.showSnackbar("إضافة كود حسم", "تم تطبيق الكود بنجاح");
    } catch (e) {
      Helper.showSnackbar("إضافة كود حسم", e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  /// حذف منتج من السلة
  void removeProduct(ResultModel product) {
    cartProducts.remove(product);
    cartProductsIds.remove(product.id);
    getPrice();
    update();
  }

  /// حساب السعر الإجمالي
  void getPrice() {
    totalPrice = 0;
    totalNumber = 0;
    cartProductsIds.clear();

    for (var product in cartProducts) {
      cartProductsIds.add(product.id);
      totalPrice += product.price;
      totalNumber++;
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    cartProducts = Get.arguments['cartProducts'];
    getPrice();
  }
}


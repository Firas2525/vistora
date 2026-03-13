import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/helpers.dart';
import '../../../core/utils/shared_prefs_helper.dart';
import '../../login/view/login.dart';
import '../model/home_model.dart';
import '../repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});

  bool isLoading = false;
  bool resultsIsLoading = false;
  bool scrollClothing = false;

  List<CategoryModel> categories = [];
  List<TagModel> tags = [];
  List<ResultModel> results = [];
  List<ResultModel> cartProducts = [];
  List<int> cartProductsIds = [];
  List<AddsModel> adds = [];
  List<int> selectedTags = [];

  ScrollController myScroll = ScrollController();
  ScrollController myScrollClothes = ScrollController();
  PageController addsController = PageController();
  TextEditingController searchController = TextEditingController();
  int addsCurrentPage = 0;
  bool firstTime = true;

  /// تحديث حالة التحميل
  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  /// جلب التصنيفات
  Future<void> getCategories() async {
    setLoading(true);
    categories = await homeRepository.getCategories();
    setLoading(false);
    getAdds();
  }

  /// جلب العلامات (Tags)
  Future<void> getTags() async {
    setLoading(true);
    tags = await homeRepository.getTags();
    setLoading(false);
    getCategories();
  }

  /// جلب المنتجات
  Future<void> getResults() async {
    resultsIsLoading = true;
    update();

    results = await homeRepository.getResults(selectedTags);

    if (results.isEmpty) {
      Helper.showSnackbar("الصفحة الرئيسية", "حدث خطأ .. حاول من جديد");
    }

    resultsIsLoading = false;
    update();
  }

  /// جلب الإعلانات
  Future<void> getAdds() async {
    setLoading(true);
    adds = await homeRepository.getAdds();
    setLoading(false);
    startAddsAutoScroll();
  }

  /// البحث عن المنتجات
  Future<void> getSearchResults() async {
    setLoading(true);
    results = await homeRepository.searchProducts(searchController.text);
    if (results.isEmpty) {
      Helper.showSnackbar("نتائج البحث", "حدث خطأ .. حاول من جديد");
    }
    setLoading(false);
  }

  /// إضافة منتج إلى السلة
  void addToCart(ResultModel item) {
    final token = SharedPrefsHelper.getString("token");
    if (token == null) {
      Helper.showSnackbar("المعذرة", "يجب أن تقوم بتسجيل الدخول");
      Get.offAll(() => Login());
      return;
    }

    if (item.available &&
        !cartProducts.contains(item) &&
        !cartProductsIds.contains(item.id)) {
      cartProducts.add(item);
      cartProductsIds.add(item.id);
      Helper.showSnackbar("إضافة إلى السلة", "تمت الإضافة بنجاح");
    } else {
      Helper.showSnackbar(
        "إضافة إلى السلة",
        cartProductsIds.contains(item.id)
            ? "المعذرة .. المنتج موجود في السلة مسبقًا"
            : "المعذرة .. المنتج غير متوفر حاليًا",
      );
    }
    update();
  }

  void removeFromCart(ResultModel item) {
    cartProducts.removeWhere((element) => element.id == item.id);
    cartProductsIds.remove(item.id);
    update();
  }

  /// تغيير تحديد التصنيفات
  void changeSelectedCategories(CategoryModel categoryItem) {
    categoryItem.selected = !categoryItem.selected;
    selectedTags.contains(categoryItem.id)
        ? selectedTags.remove(categoryItem.id)
        : selectedTags.add(categoryItem.id);
    update();
    getResults();
  }

  /// التمرير التلقائي للإعلانات
  void startAddsAutoScroll() {
    if (firstTime) {
      Timer.periodic(const Duration(seconds: 5), (timer) {
        if (addsController.hasClients) {
          if (addsController.page! < adds.length - 1) {
            addsController.nextPage(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut);
          } else {
            addsController.animateToPage(0,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut);
          }
        }
      });
      firstTime = false;
    }
  }

  void changeScroll() {
    scrollClothing = !scrollClothing;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getTags();
    getResults();
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import 'CustomAppBar.dart';
class BuildSearch extends StatelessWidget {
  const BuildSearch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.isLoading
          ? Container()
          : Column(
        children: [
          SizedBox(height: height * 0.05),
          CustomAppBar(
            searchController: controller.searchController,
            function: controller.getSearchResults,
          ),
        ],
      );
    });
  }
}
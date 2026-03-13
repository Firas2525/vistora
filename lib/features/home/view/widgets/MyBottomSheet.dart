import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'MyBottomSheetContent.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({Key? key, required this.gridview, required this.title}) : super(key: key);
  final Widget gridview;
  final String title;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        color: AppColors.white,
      ),
      height: height * 0.8,
      child:  MyBottomSheetContent(gridview:gridview, title: title,),
    );
  }
}

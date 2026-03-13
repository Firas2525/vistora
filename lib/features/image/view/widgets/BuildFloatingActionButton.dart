import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';

class BuildFloatingActionButton extends StatelessWidget {
  const BuildFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: (){Get.back();},
      elevation: 0,
      backgroundColor: AppColors.white,
      child: const Icon(Icons.arrow_back,color: AppColors.specialPink,),
    );
  }
}
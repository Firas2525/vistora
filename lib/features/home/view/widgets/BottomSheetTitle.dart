import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';



class BottomSheetTitle extends StatelessWidget {
  const BottomSheetTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          gradient: LinearGradient(colors: [
            Colors.indigo.shade50,
            AppColors.white,
          ]),
          border: const Border(
              bottom: BorderSide(color: Colors.black, width: 0.5))),
      height: height * 0.1,
      child: Center(
        child: Text(title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.05)),
      ),
    );
  }
}

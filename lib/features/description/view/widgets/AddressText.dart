import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';


class AddressText extends StatelessWidget {
  const AddressText({Key? key, required this.text1, required this.text2})
      : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style:
                TextStyle(fontSize: width * 0.045, fontWeight: FontWeight.bold),
          ),
          InkWell(
            child: Text(
              "$text2 ل.س",
              style: TextStyle(
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: AppColors.specialPink),
            ),
          ),
        ],
      ),
    );
  }
}

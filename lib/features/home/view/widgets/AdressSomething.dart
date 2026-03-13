import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class AddressSomeThing extends StatelessWidget {
  const AddressSomeThing(
      {Key? key, required this.address, required this.function})
      : super(key: key);
  final String address;
  final Function function;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.07),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            address,
            style:
                TextStyle(fontSize: width * 0.045, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              function();
            },
            child: Text(
              "عرض الكل",
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

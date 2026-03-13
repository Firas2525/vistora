import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../home/model/home_model.dart';

class ItemDetailsColumn extends StatelessWidget {
  const ItemDetailsColumn({Key? key, required this.result}) : super(key: key);

  final ResultModel result;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.12),
          child: Text(
            result.name,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(height: width * 0.02),
        Text(
          "الخصم : ${result.discount} %",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.025),
        ),
        SizedBox(height: width * 0.01),
        Text(
          "السعر بعد الخصم :",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.025),
        ),
        SizedBox(height: width * 0.01),
        Text(
          "${result.price} ل.س",
          style: TextStyle(
            fontSize: width * 0.035,
            color:  AppColors.specialPink,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../model/order_model.dart';

class ItemDetailsColumn extends StatelessWidget {
  const ItemDetailsColumn({Key? key, required this.order}) : super(key: key);
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 4,
          child: Text(
            order.note,
            style:  TextStyle(
                fontSize: width * 0.035,
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            " الخصم : ${order.couponsDiscount??"لا يوجد كود خصم"}",
            style: TextStyle(
              fontSize: width * 0.025,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            "السعر النهائي :",
            style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: width * 0.025,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            "${order.totalPrice} ل.س",
            style: TextStyle(
                fontSize: width * 0.03,
                color:  AppColors.specialPink,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        )
      ],
    );
  }
}

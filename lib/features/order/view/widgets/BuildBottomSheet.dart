import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../model/order_model.dart';
import 'OrderProducts.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({Key? key, required this.order}) : super(key: key);
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        color:  AppColors.white,
      ),
      height: height * 0.8,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    gradient: LinearGradient(colors: [
                      Colors.indigo.shade50,
                       AppColors.white,
                    ]),
                    border: const Border(
                        bottom: BorderSide(color: Colors.black, width: 0.5))),
                height: height * 0.1,
                child: Center(
                  child: Text("المشتريات",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.05)),
                ),
              )),
          Expanded(
              flex: 7,
              child: OrderProducts(
                order: order,
              ))
        ],
      ),
    );
  }
}


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../model/order_model.dart';
import 'ItemDetailsColumn.dart';

class ItemContains extends StatelessWidget {
  const ItemContains({Key? key, required this.order}) : super(key: key);
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: height * 0.12,
            width: width * 0.3,
            decoration: BoxDecoration(
             // color: colorBlack12,
              image: DecorationImage(
                image: AssetImage(order.status=="pending"?"assets/images/wall-clock.png":
                order.status=="success"?"assets/images/check.png":"assets/images/close.png"
                ),
                onError: (exception, stackTrace) {
                  if (kDebugMode) {
                    print(exception);
                  }
                },
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Expanded(flex: 1, child: Container()),
        Expanded(flex: 7, child: ItemDetailsColumn(order:order))
      ],
    );
  }
}

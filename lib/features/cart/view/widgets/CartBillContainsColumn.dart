import 'package:flutter/material.dart';
import 'BuildText.dart';
import 'RowButtons.dart';

class CartBillContainsColumn extends StatelessWidget {
  const CartBillContainsColumn(
      {Key? key,
      required this.price,
      required this.number,
      required this.function1,
      required this.function2,
      required this.addressController,
      required this.couponController,
      required this.phoneController})
      : super(key: key);
  final num price;
  final int number;
  final Function function1;
  final Function function2;
  final TextEditingController addressController;
  final TextEditingController couponController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        BuildText(text: "السعر الكلي : $price ل.س", width: width),
        BuildText(text: "الخصم : $number %", width: width),
        BuildText(text: "التوصيل : مجاني", width: width),
        BuildText(
            text:
                "السعر النهائي : ${(price - (price * number / 100)).round()} ل.س",
            width: width),
        const SizedBox(height: 20),
        Expanded(
            flex: 3,
            child: RowButtons(
              price: price,
              number: number,
              function1: function1,
              function2: function2,
              addressController: addressController,
              couponController: couponController,
              phoneController: phoneController,
            )),
        Expanded(
          flex: 8,
          child: Container(),
        )
      ],
    );
  }
}


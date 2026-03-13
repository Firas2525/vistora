
import 'package:flutter/material.dart';
import '../../model/order_model.dart';
import 'ItemInOrder.dart';

class ElementsListView extends StatefulWidget {
  const ElementsListView({Key? key, required this.orders}) : super(key: key);
  final List<OrderModel> orders;

  @override
  State<ElementsListView> createState() => _ElementsListViewState();
}

class _ElementsListViewState extends State<ElementsListView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: EdgeInsets.only(bottom: height * 0.01, top: height * 0.005),
      itemCount: widget.orders.length,
      itemBuilder: (context, index) {
        return ItemInOrder(
          order: widget.orders[index],
        );
      },
    );
  }
}

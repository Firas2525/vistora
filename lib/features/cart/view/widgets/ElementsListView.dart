import 'package:flutter/material.dart';
import '../../../home/model/home_model.dart';
import 'ItemInCart.dart';

class ElementsListView extends StatefulWidget {
  const ElementsListView({Key? key, required this.cartProducts, required this.function}) : super(key: key);
  final List<ResultModel> cartProducts;
  final Function function;
  @override
  State<ElementsListView> createState() => _ElementsListViewState();
}

class _ElementsListViewState extends State<ElementsListView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: EdgeInsets.only(bottom: height * 0.25, top: height * 0.02),
      itemCount: widget.cartProducts.length,
      itemBuilder: (context, index) {
        return ItemInCart(
          result:  widget.cartProducts[index],
            function:widget.function
        );
      },
    );
  }
}


import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../home/model/home_model.dart';
import 'ElementsListView.dart';

class CartListView extends StatefulWidget {
  const CartListView(
      {Key? key, required this.cartProducts, required this.function})
      : super(key: key);
  final List<ResultModel> cartProducts;
  final Function function;

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [ AppColors.white,  AppColors.white])),
        height: height * 0.82,
        child: ElementsListView(
            cartProducts: widget.cartProducts, function: widget.function));
  }
}

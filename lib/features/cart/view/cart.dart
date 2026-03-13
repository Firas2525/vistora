import 'package:clothesget/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../cart/view/widgets/BuildBottomNavigationBar.dart';
import 'cartBody.dart';
class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
        ),
        title: const Text("Cart", style: TextStyle(color: AppColors.white)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          CartBody(
            height: size.height,
            width: size.width,
          ),
          Positioned(
            bottom: size.height * 0.025,
            left: size.width * 0.07,
            right: size.width * 0.07,
            child: MediaQuery.of(context).viewInsets.bottom > 0
                ? Container()
                : const BuildBottomNavigationBar(),
          ),
        ],
      ),
    );
  }
}


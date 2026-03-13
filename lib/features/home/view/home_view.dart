import 'package:flutter/material.dart';
import '../../home/view/widgets/BuildBottomNavigationBar.dart';
import 'home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          const HomeViewBody(),
          Positioned(
            bottom: height * 0.025,
            left: width * 0.07,
            right: width * 0.07,
            child: MediaQuery.of(context).viewInsets.bottom > 0
                ? Container()
                : BuildBottomNavigationBar(),
          ),
        ],
      ),
    );
  }
}

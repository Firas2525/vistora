import 'package:clothesget/features/account/view/widgets/AccountBody.dart';
import 'package:flutter/material.dart';

import '../../account/view/widgets/BuildBottomNavigationBar.dart';
import '../../account/view/widgets/StackItemBackground.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/4.jpg",
                  ),
                  fit: BoxFit.fill)),
          child: Stack(
        children: [
          const StackItemBackground(
            color: Colors.white70,
          ),
          const StackItemBackground(
            color: Colors.white38,
          ),
          AccountBody(),
          Positioned(
            bottom: size.height * 0.025,
            left: size.width * 0.07,
            right: size.width * 0.07,
            child: MediaQuery.of(context).viewInsets.bottom > 0
                ? Container()
                :  BuildBottomNavigationBar(),
          ),
        ],
      )),
    );
  }
}


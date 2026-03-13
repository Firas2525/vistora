import 'package:clothesget/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/account_controller.dart';
import 'InfoRow.dart';
import 'LogOutButton.dart';
import 'NotificationRow.dart';

class AccountBody extends StatelessWidget {
  AccountBody({Key? key}) : super(key: key);
  final controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<AccountController>(builder: (controller) {
      return controller.isLoading
          ? const LoadingWidget()
          : ListView(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                SizedBox(
                    height: height * 0.3,
                    child:
                        Center(child: Image.asset("assets/images/logo.png"))),
                SizedBox(
                  height: height * 0.05,
                ),
                InfoRow(text: controller.userName, icon: Icons.person),
                SizedBox(
                  height: height * 0.01,
                ),
                InfoRow(text: controller.email, icon: Icons.email),
                SizedBox(
                  height: height * 0.01,
                ),
                InfoRow(
                    text: controller.phone == "null"
                        ? "لا يوجد"
                        : controller.phone,
                    icon: Icons.phone),
                SizedBox(
                  height: height * 0.05,
                ),
                const NotificationRow(),
                SizedBox(
                  height: height * 0.05,
                ),
                const LogOutButton()
              ],
            );
    });
  }
}

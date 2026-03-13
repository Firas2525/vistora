import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../home/view/home_view.dart';
import '../../../login/view/widgets/CustomButton.dart';
import '../../../login/view/widgets/CustomTextForm.dart';
import '../../controller/login_controller.dart';
import 'DontHaveAccount.dart';
class ListViewElements extends StatelessWidget {
  const ListViewElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return   GetBuilder<LoginController>(builder: (controller) {
      return ListView(
        children: [
          SizedBox(
            height: height * 0.2,
          ),
          SizedBox(
              height: height * 0.2,
              child: Center(
                  child: Image.asset("assets/images/logo.png"))),
          SizedBox(
            height: height * 0.005,
          ),
          CustomTextForm(
            label: 'البريد الالكتروني',
            myController: controller.myEmail,
            icon: Icons.email,
          ),
          SizedBox(
            height: height * 0.015,
          ),
          CustomTextForm(
            label: 'كلمة المرور',
            myController: controller.myPassword,
            icon: Icons.lock,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          CustomButton(
            buttonText: 'تسجيل الدخول',
            function: () {
              controller.login();
            },
          ),
          SizedBox(
            height: height * 0.03,
          ),
          const DontHaveAccount(),
          SizedBox(
            height: height * 0.02,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Get.to(() => const HomeView());
              },
              child: Text(
                "الدخول كزائر",
                style: TextStyle(
                    color: AppColors.specialPink,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.032),
              ),
            ),
          ),
        ],
      );});
  }
}
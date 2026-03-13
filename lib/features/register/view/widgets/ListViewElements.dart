import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../register/view/widgets/CustomButton.dart';
import '../../../register/view/widgets/CustomTextForm.dart';
import '../../controller/register_controller.dart';
import 'HaveAccount.dart';
class ListViewElements extends StatelessWidget {
  const ListViewElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return   GetBuilder<RegisterController>(builder: (controller) {
      return ListView(
        children: [
          MediaQuery.of(context).viewInsets.bottom > 0
              ?Container(): SizedBox(
            height: height * 0.1,
          ),
          SizedBox(height: height*0.2,child: Center(child: Image.asset("assets/images/logo.png"))),
          SizedBox(
            height: height * 0.005,
          ),
          CustomTextForm(
            label: 'البريد الالكتروني',
            myController: controller.myEmail, icon: Icons.email,
          ),
          SizedBox(
            height: height * 0.015,
          ),
          CustomTextForm(
            label: 'كلمة المرور',
            myController: controller.myPassword, icon: Icons.lock,
          ),
          SizedBox(
            height: height * 0.015,
          ),
          CustomTextForm(
            label: 'اسم المستخدم',
            myController: controller.myUserName, icon: Icons.person,
          ),
          SizedBox(
            height: height * 0.015,
          ),
          CustomTextForm(
            label: 'رقم الهاتف',
            myController: controller.myPhone, icon: Icons.phone,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          CustomButton(
            buttonText: 'إنشاء حساب',
            function: () {
              controller.register();
            },
          ),
          SizedBox(
            height: height * 0.04,
          ),
          const HaveAccount(),
          SizedBox(
            height: height * 0.01,
          ),
        ],
      );});
  }
}


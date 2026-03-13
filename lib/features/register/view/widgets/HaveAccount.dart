import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../login/view/login.dart';
class HaveAccount extends StatelessWidget {
  const HaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "لديك حساب ؟",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: width * 0.03),
        ),
        SizedBox(width: width*0.02,),
        InkWell(
          onTap: (){
            Get.off(() => const Login());
          },
          child: Text(
            "تسجيل الدخول",
            style: TextStyle(
                color:  AppColors.specialPink,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.032),
          ),
        ),
      ],
    );
  }
}
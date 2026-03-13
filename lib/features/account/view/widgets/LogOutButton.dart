import 'package:clothesget/core/constants/app_colors.dart';
import 'package:clothesget/core/utils/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/shared_prefs_helper.dart';
import '../../../login/view/login.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(onTap: (){
      DialogHelper.showConfirmationDialog(title: "تسجيل الخروج",
          question: "هل تريد تسجيل الخروج", onConfirm:
              () => {
                SharedPrefsHelper.remove("token"),
            Get.offAll(const Login())
          });
    },
      child: Container(
        height: height * 0.055,
        margin: EdgeInsets.symmetric(horizontal: width * 0.3),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
              "تسجيل الخروج",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
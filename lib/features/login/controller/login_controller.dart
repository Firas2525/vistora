import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/helpers.dart';
import '../../../core/utils/shared_prefs_helper.dart';
import '../../home/view/home_view.dart';
import '../repository/auth_repository.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository;

  LoginController({required this.authRepository});

  bool isLoading = false;
  TextEditingController myEmail = TextEditingController();
  TextEditingController myPassword = TextEditingController();

  Future<void> login() async {
    isLoading = true;
    update();

    if (myEmail.text.isEmpty) {
      Helper.showSnackbar("تسجيل الدخول", "يرجى التحقق من البريد الالكتروني");
    } else if (myPassword.text.length < 8) {
      Helper.showSnackbar("تسجيل الدخول", "كلمة المرور يجب أن تكون 8 محارف على الأقل");
    } else {
      final data = await authRepository.login(myEmail.text, myPassword.text);

      if (data != null) {
        await SharedPrefsHelper.setString('token', data['token']);
        await SharedPrefsHelper.setString('user_name', "${data['user']['user_name']}");
        await SharedPrefsHelper.setString('email', "${data['user']['email']}");
        await SharedPrefsHelper.setString('phone', "${data['user']['phone']}");

        Helper.showSnackbar("تسجيل الدخول", "تم التسجيل بنجاح");
        Get.offAll(() => HomeView());
      } else {
        Helper.showSnackbar("تسجيل الدخول", "تحقق من البريد الالكتروني و كلمة المرور");
      }
    }

    isLoading = false;
    update();
  }
}

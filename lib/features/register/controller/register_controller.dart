import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/helpers.dart';
import '../../../core/utils/shared_prefs_helper.dart';
import '../../home/view/home_view.dart';
import '../../register/repository/auth_repository.dart';

class RegisterController extends GetxController {
  final AuthRepository authRepository;

  RegisterController({required this.authRepository});

  bool isLoading = false;
  TextEditingController myEmail = TextEditingController();
  TextEditingController myPassword = TextEditingController();
  TextEditingController myUserName = TextEditingController();
  TextEditingController myPhone = TextEditingController();

  Future<void> register() async {
    isLoading = true;
    update();

    if (myEmail.text.isEmpty || myPhone.text.isEmpty || myUserName.text.isEmpty) {
      Helper.showSnackbar("إنشاء الحساب", "يرجى التحقق من البيانات المدخلة");
    } else if (myPassword.text.length < 8) {
      Helper.showSnackbar("إنشاء الحساب", "كلمة المرور يجب أن تكون 8 محارف على الأقل");
    } else {
      final data = await authRepository.register(
          myEmail.text, myUserName.text, myPassword.text, myPhone.text);

      if (data != null && !data.containsKey("error")) {
        await SharedPrefsHelper.setString('token', data['token']);
        await SharedPrefsHelper.setString('user_name', myUserName.text);
        await SharedPrefsHelper.setString('email', myEmail.text);
        await SharedPrefsHelper.setString('phone', myPhone.text);

        Helper.showSnackbar("إنشاء الحساب", "تم إنشاء الحساب بنجاح");
        Get.offAll(() => const HomeView());
      } else {
        Helper.showSnackbar("خطأ إنشاء الحساب", data?['error'] ?? "حدث خطأ غير معروف");
      }
    }

    isLoading = false;
    update();
  }
}

import 'package:get/get.dart';
import '../../../core/utils/helpers.dart';
import '../../login/view/login.dart';
import '../repository/account_repository.dart';

class AccountController extends GetxController {
  final AccountRepository _repository = AccountRepository();

  bool isLoading = false;
  String userName = '';
  String email = '';
  String phone = '';

  Future<void> getInformation() async {
    isLoading = true;
    update();

    var userInfo = await _repository.getUserInformation();

    if (userInfo == null) {
      Helper.showSnackbar("المعذرة", "يجب أن تقوم بتسجيل الدخول");
      Get.offAll(() => const Login());
    } else {
      userName = userInfo["userName"]!;
      email = userInfo["email"]!;
      phone = userInfo["phone"]!;
    }

    isLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getInformation();
  }
}

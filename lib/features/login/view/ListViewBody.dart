import 'package:clothesget/core/widgets/loading_widget.dart';
import 'package:clothesget/features/login/repository/auth_repository.dart';
import 'package:clothesget/features/login/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../login/view/widgets/StackItemBackground.dart';
import '../../login/view/widgets/ListViewElements.dart';
import '../controller/login_controller.dart';

class ListViewBody extends StatefulWidget {
  const ListViewBody({Key? key}) : super(key: key);

  @override
  State<ListViewBody> createState() => _ListViewBodyState();
}

class _ListViewBodyState extends State<ListViewBody> {
  final controller = Get.put(LoginController(authRepository: AuthRepository(authService: AuthService())));

  @override
  Widget build(BuildContext context) {
    return Container(
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
          GetBuilder<LoginController>(builder: (controller) {
            return controller.isLoading
                ? const LoadingWidget()
                : const ListViewElements();
          }),
        ],
      ),
    );
  }
}

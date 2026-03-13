import 'package:clothesget/core/widgets/loading_widget.dart';
import 'package:clothesget/features/register/repository/auth_repository.dart';
import 'package:clothesget/features/register/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../register/view/widgets/StackItemBackground.dart';
import '../../register/view/widgets/ListViewElements.dart';
import '../controller/register_controller.dart';

class ListViewBody extends StatefulWidget {
  const ListViewBody({Key? key}) : super(key: key);

  @override
  State<ListViewBody> createState() => _ListViewBodyState();
}

class _ListViewBodyState extends State<ListViewBody> {
  final controller =
      Get.put(RegisterController(authRepository: AuthRepository(authService: AuthService())));

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
          GetBuilder<RegisterController>(builder: (controller) {
            return controller.isLoading ? const LoadingWidget() : ListViewElements();
          }),
        ],
      ),
    );
  }
}

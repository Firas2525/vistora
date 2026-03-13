import 'package:flutter/material.dart';
import '../../login/view/ListViewBody.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListViewBody(),
    );
  }
}
